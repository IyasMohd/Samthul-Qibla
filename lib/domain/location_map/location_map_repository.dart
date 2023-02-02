import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:samthul_qibla/domain/core/failure/main_failure.dart';
import 'package:samthul_qibla/domain/current_location/current_location_repository.dart';
import 'package:samthul_qibla/domain/location_map/models/location_map_model.dart';
import 'package:samthul_qibla/infrastructure/location_map.dart/location_map_service.dart';
import 'package:samthul_qibla/presentation/current_location/functions_current_location.dart';
import 'package:samthul_qibla/presentation/location_from_map/location_map_functions.dart';
import 'package:samthul_qibla/presentation/manual_location/functions_manual.dart';

@LazySingleton(as: LocationMapService)
class LocationMapRepository implements LocationMapService {
  @override
  Future<Either<MainFailure, LocationMapModel>> getSamthFromMap() async {
    try {
      //check permission
      final permissioEnabled =
          await Permission.locationWhenInUse.request().isGranted;
      if (permissioEnabled) {
        // get current Location's Position
        log('location Enabled');

        final longitudeConverted =
            convertLongDecimalTolatlong(selectedPosition.value.longitude);
        final latitudeConverted =
            convertLatDecimalTolatlong(selectedPosition.value.latitude);

        // get Samthul Qibla

        final aralulBalad =
            convertNegativeintoPositive(selectedPosition.value.latitude);

        final thoolulBalad =
            convertNegativeintoPositive(selectedPosition.value.longitude);
        const araluMakka = 21.41666667;
        const thooluMakka = 39.9;
        final longitudeDirectionEast = thoolAralDirection(thoolulBalad);
        final latitudeDirectionNorth = thoolAralDirection(aralulBalad);
        final qausuSsamth = samthulQibla(aralulBalad, araluMakka, thoolulBalad,
            longitudeDirectionEast, latitudeDirectionNorth);
        final qausuSsamthConverted = convertDecimalTolatlong(qausuSsamth);

         //get Direction from.....to.....
        final samathDirectionString = samthDirection(
            aralulBalad,
            araluMakka,
            latitudeDirectionNorth,
            thoolulBalad,
            thooluMakka,
            longitudeDirectionEast,);

        return Right(
          LocationMapModel(
            latittude: latitudeConverted,
            longitude: longitudeConverted,
            samthulQibla: qausuSsamthConverted,
            direction: samathDirectionString,
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

  @override
  Future<AddressModel> getAddress() async {
    try {
      //get location Address

      final currentAddress = await placemarkFromCoordinates(
        selectedPosition.value.latitude,
        selectedPosition.value.longitude,
      ).then((List<Placemark> placemarks) {
        Placemark place = placemarks[0];

        log(place.toString());
        final addressString =
            '${place.street},${place.subLocality},${place.subAdministrativeArea}';
        log(addressString);
        return addressString;
      });
      return AddressModel(address: currentAddress);
    } catch (e) {
      return const AddressModel(address: 'No address provided');
    }
  }
}
