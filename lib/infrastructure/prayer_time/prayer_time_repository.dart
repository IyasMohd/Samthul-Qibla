import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart' show rootBundle;
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:samthul_qibla/domain/prayer_time/model/from_json/from_json.dart';
import 'package:samthul_qibla/domain/prayer_time/model/prayer_time_model.dart';
import 'package:samthul_qibla/domain/prayer_time/prayer_time_service.dart';


@LazySingleton(as: PrayerTimeService)
class PrayerTimeRepository implements PrayerTimeService {
  @override
  Future<PrayerTimeModel> initialize() {
    final model = namazTime();
    return model;
  }

  Future<PrayerTimeModel> namazTime() async {
    final DateTime date = DateTime.now();
    const aralulBalad = 11.86666667;
    const isAralulBaladDirectionNorth = true;
    const thoolulBalad = 75.41666667;
    //Sun Declination>>
    String data = await rootBundle
        .loadString("lib/assets/json/declination-etransit.json");
    final jsonResult = jsonDecode(data);
    final list = (jsonResult as List).map(((e) {
      return DeclinationAndTransit.fromJson(e);
    })).toList();

    final mailAvval = list[0].sunDeclination;
    print(mailAvval);
    const isMailAvvalDirectionNorth = false;
    const thoolMouliulIyar = 82.5;
    //Ephemeris transit>>
    //convert String to DateTime
    String dateString = list[0].ephemerisTransit;
    String dateWithT =
        '${dateString.substring(0, 8)}T${dateString.substring(8)}';
    DateTime dateTime = DateTime.parse(dateWithT);
    final String hour = DateFormat.H().format(dateTime);
    final String minute = DateFormat.m().format(dateTime);
    final String second = DateFormat.s().format(dateTime);

    final timeDecimal = convertTimetoDecimal(hour, minute, second);
    final vaqthzavalMouliu = timeDecimal;
    // print(vaqthzavalMouliu);
    final jaibulAral = sin(aralulBalad * (pi / 180.0));
    final jaibulMail = sin(mailAvval * (pi / 180.0));
    final buadulQuthr = jaibulAral * jaibulMail;
    // print(buadulQuthr);
    final aslMuthlaq =
        (cos(aralulBalad * (pi / 180))) * (cos(mailAvval * (pi / 180)));
    // print(aslMuthlaq);
    final nisfulFazla = asin(buadulQuthr / aslMuthlaq) * (180 / pi);
    // print(nisfulFazla);
    final mabainThoolaini = mabainaThoolaini(thoolMouliulIyar, thoolulBalad);
    // print(mabainThoolaini);
    final hissathuMabainathoolaini = mabainThoolaini / 15;
    // print(hissathuMabainathoolaini);
    final zuharTime = zuhar(thoolMouliulIyar, thoolulBalad, vaqthzavalMouliu,
        hissathuMabainathoolaini);
    // print(zuharTime);
    final zuhrTimeConverted = converDecimalToDateTime(zuharTime);

    final isAralandMailSameDirectionBool = isAralandMailSameDirection(
      isMailAvvalDirectionNorth,
      isAralulBaladDirectionNorth,
    );
    // print(isAralandMailSameDirectionBool);
    final gayathulIrthifa = getGayathulIrthifa(
        isAralandMailSameDirectionBool, aralulBalad, mailAvval);
    // print(gayathulIrthifa);
    final zilluGaythulIrthifa = 1 / tan(gayathulIrthifa * (pi / 180));
    // print(zilluGaythulIrthifa);
    final zilluAsriShafiee = zilluGaythulIrthifa + 1;
    final irthifaZilluAsriShafiee = atan(1 / zilluAsriShafiee) * (180 / pi);
    // print(irthifaZilluAsriShafiee);
    final jaibuIrthifauZillu = sin(irthifaZilluAsriShafiee * (pi / 180));
    final aslMuaddaluShafiee = getAsluMuaddaluShafiee(
      isAralandMailSameDirectionBool,
      buadulQuthr,
      jaibuIrthifauZillu,
    );
    // print(aslMuaddaluShafiee);
    final kharijulQismathuShafiee = aslMuaddaluShafiee / aslMuthlaq;
    // print(kharijulQismathuShafiee);
    final qousulKharij = asin(kharijulQismathuShafiee) * (180 / pi);
    // print(qousulKharij);
    final dairathubainalAsriVaZuhr = 90 - qousulKharij;
    final hissathuDairathubainalAsriVaZuhr = dairathubainalAsriVaZuhr / 15;
    // print(hissathuDairathubainalAsriVaZuhr);
    final asruShafiee = zuharTime + hissathuDairathubainalAsriVaZuhr;
    // print(asruShafiee);
    final asruShafieeConverted = converDecimalToDateTime(asruShafiee);

    final dairathunBainalAsriValMagribi = getDairathunBainalAsriValMagribi(
        isAralandMailSameDirectionBool, qousulKharij, nisfulFazla);
    // print(dairathunBainalAsriValMagribi);
    final hissthudairathunBainalAsriValMagribi =
        dairathunBainalAsriValMagribi / 15;
    // print(hissthudairathunBainalAsriValMagribi);
    final magribTime = zuharTime +
        hissathuDairathubainalAsriVaZuhr +
        hissthudairathunBainalAsriValMagribi +
        (4 / 60);
    // print(magribTime);
    final magribTimeConverted = converDecimalToDateTime(magribTime);

    final zilluAsrilHanafee = zilluGaythulIrthifa + 2;
    final irthifaZilluAsrilHanafe = atan(1 / zilluAsrilHanafee) * (180 / pi);
    // print(irthifaZilluAsrilHanafe);
    final jaibuIrthifaZilluAsrilHanafee =
        sin(irthifaZilluAsrilHanafe * (pi / 180));

    final asluMuaddalulHanafee = getAsluMuaddalulHanafee(
        isAralandMailSameDirectionBool,
        buadulQuthr,
        jaibuIrthifaZilluAsrilHanafee);
    // print(asluMuaddalulHanafee);
    final kharijulQismathulHanafee = asluMuaddalulHanafee / aslMuthlaq;
    final qousuKharijulQismathulHanafee =
        asin(kharijulQismathulHanafee) * (180 / pi);
    // print(qousuKharijulQismathulHanafee);

    final thulooaTime = zuharTime -
        (hissathuDairathubainalAsriVaZuhr +
            hissthudairathunBainalAsriValMagribi +
            (4 / 60));
    // print(thulooaTime);
    final thulooaTimeConverted = converDecimalToDateTime(thulooaTime);

    final asluMuaddalIndaShafaqi =
        getAsluMuaddalIndaShafaqi(isAralandMailSameDirectionBool, buadulQuthr);
    // print(asluMuaddalIndaShafaqi);
    final kharijulQismathiAsluMuaddalIndaShafaqi =
        asluMuaddalIndaShafaqi / aslMuthlaq;
    // print(kharijulQismathiAsluMuaddalIndaShafaqi);
    final qousuKharijulQismathiAsluMuaddalIndaShafaqi =
        asin(kharijulQismathiAsluMuaddalIndaShafaqi) * (180 / pi);
    // print(qousuKharijulQismathiAsluMuaddalIndaShafaqi);
    final dairuQous = getDairuQous(
      isAralandMailSameDirectionBool,
      qousuKharijulQismathiAsluMuaddalIndaShafaqi,
      nisfulFazla,
      buadulQuthr,
    );
    // print(dairuQous);
    final hissathuShafaq = dairuQous / 15;
    final ishauShafiee = zuharTime +
        hissathuDairathubainalAsriVaZuhr +
        hissthudairathunBainalAsriValMagribi +
        (4 / 60) +
        hissathuShafaq;

    // print(ishauShafiee);
    final ishauShafieeConverted = converDecimalToDateTime(ishauShafiee);

    final asluMuaddalIndalFajri =
        getAsluMuaddalIndalFajri(isAralandMailSameDirectionBool, buadulQuthr);
    // print(asluMuaddalIndalFajri);
    final kharijuQismathiAsluMuaddalFajri = asluMuaddalIndalFajri / aslMuthlaq;
    final qousuKharijuQismathiAsluMuaddalFajri =
        asin(kharijuQismathiAsluMuaddalFajri) * (180 / pi);
    final dairuQousuKharijuQismathiFajr = getdairuQousuKharijuQismathiFajr(
        isAralandMailSameDirectionBool,
        qousuKharijuQismathiAsluMuaddalFajri,
        nisfulFazla,
        buadulQuthr);
    // print(dairuQousuKharijuQismathiFajr);
    final hissathulFajr = dairuQousuKharijuQismathiFajr / 15;
    final ishauHanafee = zuharTime +
        hissathuDairathubainalAsriVaZuhr +
        hissthudairathunBainalAsriValMagribi +
        (4 / 60) +
        hissathulFajr;
    // print(ishauHanafee);
    final subh = thulooaTime - hissathulFajr;
    final subhTimeConverted = converDecimalToDateTime(subh);
    final model = PrayerTimeModel(
      zuhrTimeConverted,
      asruShafieeConverted,
      magribTimeConverted,
      ishauShafieeConverted,
      subhTimeConverted,
    );
    return model;
  }

  DateTime converDecimalToDateTime(double decimalTime) {
    final hour = decimalTime.toInt().abs();

    final hourAfterDecimal = decimalTime - hour;

    final minute = hourAfterDecimal * 60;
    final minuteRounded = minute.toInt();
    final second = minute - minuteRounded;
    final secondCalculated = second * 60;
    final secondRounded = double.parse(secondCalculated.toStringAsFixed(0));

    String dateString = '00000000$hourAfterDecimal$minuteRounded$secondRounded';
    String dateWithT =
        '${dateString.substring(0, 8)}T${dateString.substring(8)}';
    DateTime dateTime = DateTime.parse(dateWithT);
    return dateTime;
  }

  double convertTimetoDecimal(
    String hour,
    String minute,
    String second,
  ) {
    final hourConverted = int.parse(hour);

    final minuteInt = int.parse(minute);
    final minuteDecimal = minuteInt / 60;

    final secondInt = double.parse(second);
    final secondDecimal = secondInt / 3600;

    final timeDecimal = hourConverted + minuteDecimal + secondDecimal;

    return timeDecimal;
  }

  double mabainaThoolaini(
    thoolMouliulIyar,
    thoolulBalad,
  ) {
    if (thoolMouliulIyar >= thoolulBalad) {
      return thoolMouliulIyar - thoolulBalad;
    } else {
      return thoolulBalad - thoolMouliulIyar;
    }
  }

  double zuhar(
    thoolMouliulIyar,
    thoolulBalad,
    vaqthzavalMouliu,
    hissathuMabainathoolaini,
  ) {
    if (thoolMouliulIyar >= thoolulBalad) {
      return vaqthzavalMouliu + hissathuMabainathoolaini;
    } else {
      return vaqthzavalMouliu - hissathuMabainathoolaini;
    }
  }

  bool isAralandMailSameDirection(
      isMailAvvalDirectionNorth, isAralulBaladDirectionNorth) {
    if (isMailAvvalDirectionNorth) {
      if (isAralulBaladDirectionNorth) {
        return true;
      } else {
        return false;
      }
    } else {
      if (isAralulBaladDirectionNorth) {
        return false;
      } else {
        return true;
      }
    }
  }

  double getGayathulIrthifa(bool isAralandMailSameDirectionBool,
      double aralulBalad, double mailAvval) {
    if (isAralandMailSameDirectionBool) {
      if (aralulBalad >= mailAvval) {
        return 90 - (aralulBalad - mailAvval);
      } else {
        return 90 - (mailAvval - aralulBalad);
      }
    } else {
      return 90 - (aralulBalad + mailAvval);
    }
  }

  double getAsluMuaddaluShafiee(
    isAralandMailSameDirectionBool,
    double buadulQuthr,
    double jaibuIrthifauZillu,
  ) {
    if (isAralandMailSameDirectionBool) {
      if (jaibuIrthifauZillu >= buadulQuthr) {
        return jaibuIrthifauZillu - buadulQuthr;
      } else {
        return buadulQuthr - jaibuIrthifauZillu;
      }
    } else {
      return jaibuIrthifauZillu + buadulQuthr;
    }
  }

  double getDairathunBainalAsriValMagribi(
    isAralandMailSameDirectionBool,
    qousulKharij,
    nisfulFazla,
  ) {
    if (isAralandMailSameDirectionBool) {
      if (qousulKharij >= nisfulFazla) {
        return qousulKharij + nisfulFazla;
      } else {
        return nisfulFazla - qousulKharij;
      }
    } else {
      return qousulKharij - nisfulFazla;
    }
  }

  double getAsluMuaddalulHanafee(
    bool isAralandMailSameDirectionBool,
    double buadulQuthr,
    double jaibuIrthifaZilluAsrilHanafee,
  ) {
    if (isAralandMailSameDirectionBool) {
      if (jaibuIrthifaZilluAsrilHanafee >= buadulQuthr) {
        return jaibuIrthifaZilluAsrilHanafee - buadulQuthr;
      } else {
        return buadulQuthr - jaibuIrthifaZilluAsrilHanafee;
      }
    } else {
      return jaibuIrthifaZilluAsrilHanafee + buadulQuthr;
    }
  }

  double getAsluMuaddalIndaShafaqi(
    bool isAralandMailSameDirectionBool,
    double buadulQuthr,
  ) {
    if (isAralandMailSameDirectionBool) {
      return sin(17 * (pi / 180)) + buadulQuthr;
    } else if (sin(17 * (pi / 180)) >= buadulQuthr) {
      return sin(17 * (pi / 180)) - buadulQuthr;
    } else {
      return buadulQuthr - sin(17 * (pi / 180));
    }
  }

  double getDairuQous(
    bool isAralandMailSameDirectionBool,
    double qousuKharijulQismathiAsluMuaddalIndaShafaqi,
    double nisfulFazla,
    double buadulQuthr,
  ) {
    if (isAralandMailSameDirectionBool) {
      return qousuKharijulQismathiAsluMuaddalIndaShafaqi - nisfulFazla;
    } else if ((sin(17 * (pi / 180)) >= buadulQuthr)) {
      return qousuKharijulQismathiAsluMuaddalIndaShafaqi + nisfulFazla;
    } else {
      return nisfulFazla - qousuKharijulQismathiAsluMuaddalIndaShafaqi;
    }
  }

  double getAsluMuaddalIndalFajri(
    bool isAralandMailSameDirectionBool,
    double buadulQuthr,
  ) {
    if (isAralandMailSameDirectionBool) {
      return sin(19 * (pi / 180)) + buadulQuthr;
    } else if ((sin(19 * (pi / 180))) >= buadulQuthr) {
      return sin(19 * (pi / 180)) - buadulQuthr;
    } else {
      return buadulQuthr - sin(19 * (pi / 180));
    }
  }

  double getdairuQousuKharijuQismathiFajr(
      bool isAralandMailSameDirectionBool,
      double qousuKharijuQismathiAsluMuaddalFajri,
      double nisfulFazla,
      double buadulQuthr) {
    if (isAralandMailSameDirectionBool) {
      return qousuKharijuQismathiAsluMuaddalFajri - nisfulFazla;
    } else if (sin(19 * (pi / 180)) >= buadulQuthr) {
      return qousuKharijuQismathiAsluMuaddalFajri + nisfulFazla;
    } else {
      return nisfulFazla - qousuKharijuQismathiAsluMuaddalFajri;
    }
  }
}
