import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:samthul_qibla/domain/core/failure/main_failure.dart';
import 'package:samthul_qibla/domain/current_location/models/current_location_model.dart';
import 'package:samthul_qibla/domain/current_location/current_location_service.dart';
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
        print('location Enabled');

        final currentLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
          // timeLimit: const Duration(seconds: 5),
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
            longitudeDirectionEast);

        return Right(
          CurrentLocationModel(
              address: currentAddress,
              latittude: latitudeConverted,
              longitude: longitudeConverted,
              samthulQibla: qausuSsamthConverted,
              direction: samathDirectionString),
        );
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}

String samthDirection(aralulBalad, araluMakka, latitudeDirectionNorth,
    thoolulBalad, thooluMakka, longitudeDirectionEast) {
  final jaibulAral = sin(aralulBalad * (pi / 180.0));
  final jaibulMail = sin(araluMakka * (pi / 180.0));
  final isIrthifa = isIrthifaulladiLasamthlahu(
      latitudeDirectionNorth, aralulBalad, araluMakka);
  final qousuIrthifalladi =
      qousuIrthifaulladiLasamthalahu(isIrthifa, jaibulMail, jaibulAral);

  final buadulQuthr = jaibulAral * jaibulMail;

//جيب تمام العرض

  final thammuAralulBalad = thamamuAralulbalad(aralulBalad);
  final jaibuThamamulAral = sin(thammuAralulBalad * (pi / 180.0));

//جيب تمام العرض

  final thamamulMail = 90 - araluMakka;
  final jaibuThamamulMail = sin(thamamulMail * (pi / 180.0));

  //أصل مطلق

  final aslMuthlaq = jaibuThamamulAral * jaibuThamamulMail;

//جيب تمام ما بين الطولين
  final mabainathoolaini =
      mabainaTholaini(thoolulBalad, longitudeDirectionEast);
  final jaibuThamamuMabainaThoolaini =
      jaibuthamamimabainaThoolaini(mabainathoolaini);
  //أصل معدل

  final aslMuaddal = aslMuthlaq * jaibuThamamuMabainaThoolaini;

  //جيب الإرتفاع

  final jaibulIrthifa =
      jaibulirthifa(aslMuaddal, buadulQuthr, latitudeDirectionNorth);

  //قوس الإرتفاع

  final qousulIrthifa = asin(jaibulIrthifa) * (180.0 / pi);

  final toDirection =
      samthDirectionTo(isIrthifa, qousulIrthifa, qousuIrthifalladi);
  final fromDirection =
      samthDirectionFrom(longitudeDirectionEast, thoolulBalad, thooluMakka);
  return '$fromDirection $toDirection';
}
