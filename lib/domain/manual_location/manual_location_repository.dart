import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:samthul_qibla/domain/manual_location/model/manual_location_model.dart';
import 'package:samthul_qibla/infrastructure/manual_location/manual_location_service.dart';

@LazySingleton(as: ManualLocationService)
class ManualLocationRepository implements ManualLocationService {
  @override
  ManualLocationModel getSamth(
    double aralulBalad,
    double thoolulBalad,
    bool directionEast,
    bool directionNorth,
  ) {
    const araluMakka = 21.41666667;
    const thoolMakka = 39.9;

    final jaibulAral = sin(aralulBalad * (pi / 180.0));
    final jaibulMail = sin(araluMakka * (pi / 180.0));
    final buadulQuthr = jaibulAral * jaibulMail;

//جيب تمام العرض

    final thammuAralulBalad = thamamuAralulbalad(aralulBalad);
    final jaibuThamamulAral = sin(thammuAralulBalad * (pi / 180.0));

//جيب تمام العرض

    const thamamulMail = 90 - araluMakka;
    final jaibuThamamulMail = sin(thamamulMail * (pi / 180.0));

    //أصل مطلق

    final aslMuthlaq = jaibuThamamulAral * jaibuThamamulMail;

//جيب تمام ما بين الطولين
    final mabainathoolaini = mabainaTholaini(thoolulBalad, directionEast);
    final jaibuThamamuMabainaThoolaini =
        jaibuthamamimabainaThoolaini(mabainathoolaini);
    //أصل معدل

    final aslMuaddal = aslMuthlaq * jaibuThamamuMabainaThoolaini;

    //جيب الإرتفاع

    final jaibulIrthifa =
        jaibulirthifa(aslMuaddal, buadulQuthr, directionNorth);

    //قوس الإرتفاع

    final qousulIrthifa = asin(jaibulIrthifa) * (180.0 / pi);

//إرتفاع الذي لا سمت له
    final isIrthifa =
        isIrthifaulladiLasamthlahu(directionNorth, aralulBalad, araluMakka);
    final qousuIrthifalladi =
        qousuIrthifaulladiLasamthalahu(isIrthifa, jaibulMail, jaibulAral);
    //حصة السمت

    final hissathuSamth = (jaibulIrthifa * jaibulAral) / jaibuThamamulAral;

    //جيب السعت

    final jaibuSsahath = jaibulMail / jaibuThamamulAral;

    //تعديل السمت

    final thaadeeluSamth =
        thaadeeluSsamth(hissathuSamth, jaibuSsahath, directionNorth);

    //تمام الإرتفاع

    final thamamulIrthifa = 90 - qousulIrthifa;

    //جيب تمام الإرتفاع

    final jaibuThamamulIrthifa = sin(thamamulIrthifa * (pi / 180.0));

    //جيب السمت

    final jaibuSamth = thaadeeluSamth / jaibuThamamulIrthifa;

    //قوس السمت

    final qousuSamth = asin(jaibuSamth) * (180.0 / pi);
    print(qousuSamth);
    final qousDecimal = qousSamthConvertToPositive(qousuSamth);
    final samthulQibla = convertDecimalTolatlong(qousDecimal);

    final toDirection =
        samthDirectionTo(isIrthifa, qousulIrthifa, qousuIrthifalladi);
    final fromDirection =
        samthDirectionFrom(directionEast, thoolulBalad, thoolMakka);

    return ManualLocationModel(
      samthulQibla: samthulQibla,
      direction: '$fromDirection $toDirection',
    );
  }
}

double qousSamthConvertToPositive(double qousuSamth) {
  if (qousuSamth > 0) {
    return qousuSamth;
  } else {
    return 0 - (qousuSamth);
  }
}

double latitudeconvertToDecimal(String daraja, String daqeeqa, String thaniya) {
  final darajaConverted = int.parse(daraja);

  final daqeeqaInt = int.parse(daqeeqa);
  final daqeeqaDecimal = daqeeqaInt / 60;

  final thaniyaInt = double.parse(thaniya);
  final thaniyaDecimal = thaniyaInt / 3600;

  final darajaDaqeeqaThaniya =
      darajaConverted + daqeeqaDecimal + thaniyaDecimal;

  return darajaDaqeeqaThaniya;
}

double longitudeconvertToDecimal(
    String daraja, String daqeeqa, String thaniya, bool thoolDirection) {
  final darajaConverted = int.parse(daraja);

  final daqeeqaInt = int.parse(daqeeqa);
  final daqeeqaDecimal = daqeeqaInt / 60;

  final thaniyaInt = double.parse(thaniya);
  final thaniyaDecimal = thaniyaInt / 3600;

  if (thoolDirection) {
    final darajaDaqeeqaThaniya =
        darajaConverted + daqeeqaDecimal + thaniyaDecimal;
    return darajaDaqeeqaThaniya;
  } else {
    final darajaDaqeeqaThaniya =
        0 - (darajaConverted + daqeeqaDecimal + thaniyaDecimal);
    return darajaDaqeeqaThaniya;
  }
}

String convertDecimalTolatlong(double thoolOrAral) {
  final daraja = thoolOrAral.toInt().abs();

  final darajaAfterDecimal = thoolOrAral - daraja;
  final daqeeqa = darajaAfterDecimal * 60;
  final daqeeqaRounded = daqeeqa.toInt();
  final thaniya = daqeeqa - daqeeqaRounded;
  final thaniyaCalculated = thaniya * 60;
  final thaniyaRounded = double.parse(thaniyaCalculated.toStringAsFixed(0));

  return "$daraja° $daqeeqaRounded' $thaniyaRounded''";
}

double thamamuAralulbalad(double aralulBalad) {
  final thamamuAralulbalad = 90 - aralulBalad;
  return thamamuAralulbalad;
}

double mabainaTholaini(double thoolulBalad, bool directionEast) {
  const thoolMakka = 39.9;

  if (directionEast) {
    if (thoolulBalad <= thoolMakka) {
      final mabainaThoolaini = thoolMakka - thoolulBalad;
      return mabainaThoolaini;
    } else if (thoolulBalad <= (90 + thoolMakka)) {
      final mabainaThoolaini = thoolulBalad - thoolMakka;
      return mabainaThoolaini;
    } else {
      final mabainaThoolaini = 180 - (thoolulBalad - thoolMakka);
      return mabainaThoolaini;
    }
  } else {
    if (thoolulBalad <= (90 - thoolMakka)) {
      final mabainaThoolaini = thoolulBalad + thoolMakka;
      return mabainaThoolaini;
    } else if (thoolulBalad <= (180 - thoolMakka)) {
      final mabainaThoolaini = 180 - (thoolulBalad + thoolMakka);
      return mabainaThoolaini;
    } else {
      final mabainaThoolaini = thoolulBalad - (180 - thoolMakka);
      return mabainaThoolaini;
    }
  }
}

double jaibuthamamimabainaThoolaini(double mabainathoolaini) {
  final thamamuMabainathoolaini = 90 - mabainathoolaini;
  if (thamamuMabainathoolaini <= 90) {
    final jaibuThamamuMabainaThoolaini =
        sin(thamamuMabainathoolaini * (pi / 180.0));
    return jaibuThamamuMabainaThoolaini;
  } else {
    final jaibuThamamuMabainaThoolaini =
        sin((90 - (thamamuMabainathoolaini - 90)) * (pi / 180.0));
    return jaibuThamamuMabainaThoolaini;
  }
}

double jaibulirthifa(
    double aslMuaddal, double buadulQuthr, bool directionNorth) {
  if (directionNorth) {
    final jaibulIrthifa = aslMuaddal + buadulQuthr;
    return jaibulIrthifa;
  } else if (aslMuaddal >= buadulQuthr) {
    final jaibulIrthifa = aslMuaddal - buadulQuthr;
    return jaibulIrthifa;
  } else {
    final jaibulIrthifa = buadulQuthr - aslMuaddal;
    return jaibulIrthifa;
  }
}

bool isIrthifaulladiLasamthlahu(
  bool directionNorth,
  double aralulBalad,
  double araluMakka,
) {
  if (directionNorth) {
    if (aralulBalad > araluMakka) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

double qousuIrthifaulladiLasamthalahu(
    bool isIrthifa, double jaibulMail, double jaibulAral) {
  if (isIrthifa) {
    final irthifaulladiLasamthalahu = jaibulMail / jaibulAral;
    final qousulIrthifaulladiLasamthalihu =
        asin(irthifaulladiLasamthalahu) * (180.0 / pi);
    return qousulIrthifaulladiLasamthalihu;
  } else {
    return 0;
  }
}

String samthDirectionTo(
    bool isIrthifa, double qousulIrthafa, double qousuIrthifalladi) {
  if (isIrthifa) {
    if (qousulIrthafa > qousuIrthifalladi) {
      return 'to SOUTH';
    } else {
      return 'to NORTH';
    }
  } else {
    return 'to NORTH';
  }
}

String samthDirectionFrom(
    bool directionEast, double thoolulBalad, double thooluMakka) {
  if (directionEast) {
    if (thoolulBalad > thooluMakka) {
      return 'from WEST';
    } else {
      return 'from EAST';
    }
  } else {
    if (thoolulBalad > (180 - thooluMakka)) {
      return 'from WEST';
    } else {
      return 'from EAST';
    }
  }
}

double mabainalAralaini(double aralulBalad) {
  const araluMakka = 21.41666667;

  if (aralulBalad >= araluMakka) {
    final mabainalAraliani = aralulBalad - araluMakka;
    return mabainalAraliani;
  } else {
    final mabainalAraliani = araluMakka - aralulBalad;
    return mabainalAraliani;
  }
}

double thaadeeluSsamth(
  double hissathuSamth,
  double jaibuSsahath,
  bool directionNorth,
) {
  if (directionNorth) {
    if (hissathuSamth >= jaibuSsahath) {
      final thaadeeluSsamth = hissathuSamth - jaibuSsahath;
      return thaadeeluSsamth;
    } else {
      final thaadeeluSsamth = jaibuSsahath - hissathuSamth;
      return thaadeeluSsamth;
    }
  } else {
    final thaadeeluSsamth = jaibuSsahath + hissathuSamth;
    return thaadeeluSsamth;
  }
}
