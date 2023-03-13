import 'package:flutter/cupertino.dart';

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

String convertLatDecimalTolatlong(double thoolOrAral) {
  final daraja = thoolOrAral.toInt();
  final darajaToReturn = (daraja).abs();
  final darajaAfterDecimal = thoolOrAral - daraja;
  final daqeeqa = darajaAfterDecimal * 60;
  final daqeeqaRounded = daqeeqa.toInt();
  final daqeeqaToReturn = (daqeeqaRounded).abs();

  final thaniya = daqeeqa - daqeeqaRounded;
  final thaniyaCalculated = thaniya * 60;
  final thaniyaRounded = double.parse(thaniyaCalculated.toStringAsFixed(0));
  final thaniyaToReturn = (thaniyaRounded).abs();

  final direction = daraja > 0 ? "N" : "S";
  return "$darajaToReturn° $daqeeqaToReturn' $thaniyaToReturn''\t $direction";
}

String convertLongDecimalTolatlong(double thoolOrAral) {
  final daraja = thoolOrAral.toInt();
  final darajaToReturn = (daraja).abs();

  final darajaAfterDecimal = thoolOrAral - daraja;
  final daqeeqa = darajaAfterDecimal * 60;
  final daqeeqaRounded = daqeeqa.toInt();
  final daqeeqaToReturn = (daqeeqaRounded).abs();
  final thaniya = daqeeqa - daqeeqaRounded;
  final thaniyaCalculated = thaniya * 60;
  final thaniyaRounded = double.parse(thaniyaCalculated.toStringAsFixed(0));
  final thaniyaToReturn = (thaniyaRounded).abs();

  final direction = daraja > 0 ? "E" : "W";
  return "$darajaToReturn° $daqeeqaToReturn' $thaniyaToReturn''\t $direction";
}

ValueNotifier<String> resultNotifier = ValueNotifier('سمت القبلة');

ValueNotifier<String> longitudeNotifier = ValueNotifier("0° 0' 0''");
ValueNotifier<String> latitudeNotifier = ValueNotifier("0° 0' 0''");

ValueNotifier<String> addressNotifier = ValueNotifier('Address');
