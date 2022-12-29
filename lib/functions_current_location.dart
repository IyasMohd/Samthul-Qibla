import 'package:geolocator/geolocator.dart';
import 'package:samthul_qibla/functions_manual.dart';

bool thoolAralDirection(double thoolAralDecimal) {
  if (thoolAralDecimal >= 0) {
    const thoolEastAralNorth = true;
    return thoolEastAralNorth;
  } else {
    const thoolEastAralNorth = false;
    return thoolEastAralNorth;
  }
}

double convertNegativeintoPositive(double coodinate) {
  if (coodinate < 0) {
    final convertedCoordinate = (coodinate).abs();
    return convertedCoordinate;
  } else {
    return coodinate;
  }
}

Future<Position> _getCurrentLocation() async {
  bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!isLocationServiceEnabled) {
    return Future.error('Location services are disabled');
  }

  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permissions are permenently denied');
  }
  return await Geolocator.getCurrentPosition();
}

Future<String> initialCurrentLocation() async {
  final currentLocation = await _getCurrentLocation();
  final thoolulbalad = convertNegativeintoPositive(currentLocation.latitude);

  final aralulBalad = convertNegativeintoPositive(currentLocation.longitude);
  const araluMakka = 21.41666667;
  final thoolDirectionEast = thoolAralDirection(thoolulbalad);
  final aralDirectionNorth = thoolAralDirection(aralulBalad);
  final qausuSsamth = samthulQibla(aralulBalad, araluMakka, thoolulbalad,
      thoolDirectionEast, aralDirectionNorth);
  final qausuSsamthConverted = convertDecimalTolatlong(qausuSsamth);
  return qausuSsamthConverted;
}
