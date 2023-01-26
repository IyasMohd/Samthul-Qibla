import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:samthul_qibla/domain/location_map/models/location_map.dart';
import 'package:samthul_qibla/domain/core/failure/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:samthul_qibla/infrastructure/location_map.dart/location_map_service.dart';
import 'package:samthul_qibla/presentation/current_location/functions_current_location.dart';
import 'package:samthul_qibla/presentation/location_from_map/location_map_functions.dart';
import 'package:samthul_qibla/presentation/manual_location/functions_manual.dart';


@LazySingleton(as: LocationMapService)
class LocationMapRepository implements LocationMapService{
  @override
  Future<Either<MainFailure, LocationMapModel>> getSamthFromMap() async {
    try {
      //check permission
      final permissioEnabled =
          await Permission.locationWhenInUse.request().isGranted;
      if (permissioEnabled) {
        // get current Location's Position
        log('location Enabled');

        // final currentLocation = await Geolocator.getCurrentPosition(
        //   desiredAccuracy: LocationAccuracy.best,
        //   timeLimit: const Duration(seconds: 5),
        //   // forceAndroidLocationManager: true,
        // );

        final longitudeConverted =
            convertLongDecimalTolatlong(selectedPosition.value.longitude);
        final latitudeConverted =
            convertLatDecimalTolatlong(selectedPosition.value.latitude);

        //get location Address

        final currentAddress = await placemarkFromCoordinates(
          selectedPosition.value.latitude,
          selectedPosition.value.longitude,
        ).then((List<Placemark> placemarks) {
          Placemark place = placemarks[0];

          final addressString =
              '${place.street},${place.subLocality},${place.subAdministrativeArea},${place.postalCode}';
          return addressString;
        });
        // get Samthul Qibla

        final aralulBalad =
            convertNegativeintoPositive(selectedPosition.value.latitude);

        final thoolulBalad =
            convertNegativeintoPositive(selectedPosition.value.longitude);
        const araluMakka = 21.41666667;
        final longitudeDirectionEast = thoolAralDirection(thoolulBalad);
        final latitudeDirectionNorth = thoolAralDirection(aralulBalad);
        final qausuSsamth = samthulQibla(aralulBalad, araluMakka, thoolulBalad,
            longitudeDirectionEast, latitudeDirectionNorth);
        final qausuSsamthConverted = convertDecimalTolatlong(qausuSsamth);

        return Right(
          LocationMapModel(
            address: currentAddress,
            latittude: latitudeConverted,
            longitude: longitudeConverted,
            samthulQibla: qausuSsamthConverted,
          ),
        );
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

}