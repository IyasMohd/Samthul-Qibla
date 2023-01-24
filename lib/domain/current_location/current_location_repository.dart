import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:samthul_qibla/domain/core/failure/main_failure.dart';
import 'package:samthul_qibla/domain/current_location/models/current_location_model.dart';
import 'package:samthul_qibla/infrastructure/current_location/current_location_service.dart';
import 'package:samthul_qibla/presentation/current_location/functions_current_location.dart';
import 'package:samthul_qibla/presentation/manual_location/functions_manual.dart';

@LazySingleton(as: CurrentLocationService)
class CurrentLocationRepository implements CurrentLocationService {
  @override
  Future<Either<MainFailure, CurrentLocationModel>> getcurrentLocation() async {
    try {
      //check permission
      final permissioEnabled =
          await Permission.locationWhenInUse.request().isGranted;
      if (permissioEnabled) {
        // get current Location's Position
        log('location Enabled');

        final currentLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
          timeLimit: const Duration(seconds: 5),
          // forceAndroidLocationManager: true,
        );

        final longitudeConverted =
            convertLongDecimalTolatlong(currentLocation.longitude);
        final latitudeConverted =
            convertLatDecimalTolatlong(currentLocation.latitude);

        //get location Address

        final currentAddress = await placemarkFromCoordinates(
          currentLocation.latitude,
          currentLocation.longitude,
        ).then((List<Placemark> placemarks) {
          Placemark place = placemarks[0];

          final addressString =
              '${place.street},${place.subLocality},${place.subAdministrativeArea},${place.postalCode}';
          return addressString;
        });
        // get Samthul Qibla

        final aralulBalad =
            convertNegativeintoPositive(currentLocation.latitude);

        final thoolulBalad =
            convertNegativeintoPositive(currentLocation.longitude);
        const araluMakka = 21.41666667;
        final longitudeDirectionEast = thoolAralDirection(thoolulBalad);
        final latitudeDirectionNorth = thoolAralDirection(aralulBalad);
        final qausuSsamth = samthulQibla(aralulBalad, araluMakka, thoolulBalad,
            longitudeDirectionEast, latitudeDirectionNorth);
        final qausuSsamthConverted = convertDecimalTolatlong(qausuSsamth);

        return Right(
          CurrentLocationModel(
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
