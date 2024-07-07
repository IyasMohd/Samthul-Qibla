import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart' show rootBundle;
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:samthul_qibla/domain/prayer_time/model/prayer_time_model.dart';
import 'package:samthul_qibla/domain/prayer_time/prayer_time_service.dart';
import 'package:samthul_qibla/presentation/prayer_time/prayer_time.dart';

@LazySingleton(as: PrayerTimeService)
class PrayerTimeRepository implements PrayerTimeService {
  @override
  Future<PrayerTimeModel> initialize() async {
    final model = await namazTime();
    // print(model.toString());
    return model;
  }

  Future<PrayerTimeModel> namazTime() async {
    final DateTime date = dateNotifier.value;

    // Get Year No.>>
    final String year = DateFormat("yyyy").format(date);
    final int yearParsed = int.parse(year) % 4;
    final yearNo = yearParsed + 1;
// Get Month No.>>
    final String month = DateFormat("M").format(date);

    // Get Day No.
    final String day = DateFormat("d").format(date);
    const aralulBalad = 11.86666667;
    const isAralulBaladDirectionNorth = true;
    const thoolulBalad = 75.41666667;

    //Sun Declination>>
    String data = await rootBundle
        .loadString("lib/assets/json/declination-etransit.json");
    final jsonResult = jsonDecode(data);

    final mailAvval = jsonResult[0]["Year $yearNo"]["Month $month"]["Day $day"]
        ["Sun Declination"];
    const isMailAvvalDirectionNorth = false;
    const thoolMouliulIyar = 82.5;

    //Ephemeris transit>>
    //convert String to DateTime
    String dateString =
        jsonResult[0]["Year $yearNo"]["Month $month"]["Day $day"]["E-Transit"];

    DateTime dateTime = DateTime.parse(dateString);
    final String hour = DateFormat.H().format(dateTime);
    final String minute = DateFormat.m().format(dateTime);
    final String second = DateFormat.s().format(dateTime);
    final timeDecimal = convertTimetoDecimal(hour, minute, second);

// ZUHAR >>

    final vaqthzavalMouliu = timeDecimal;
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
    final zuhrTimeConverted = convertDecimalToDateTime(zuharTime);
    // print(zuhrTimeConverted);

//ASR SHAFIEE>>

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
    final asruShafieeConverted = convertDecimalToDateTime(asruShafiee);
    // print(asruShafieeConverted);

//MAGRIB >>

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
    final magribTimeConverted = convertDecimalToDateTime(magribTime);
    // print(magribTimeConverted);

//THULOOA >>

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
    final thulooaTimeConverted = convertDecimalToDateTime(thulooaTime);
    print(thulooaTimeConverted);

// ISHAU SHAFIEE >>

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
    final ishauShafieeConverted = convertDecimalToDateTime(ishauShafiee);
    // print(ishauShafieeConverted);

// SUBH >>

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
    final subhTimeConverted = convertDecimalToDateTime(subh);

    final upcomingVaqthMap = getUpcomingVaqthandTime(
        zuhrTimeConverted,
        asruShafieeConverted,
        magribTimeConverted,
        ishauShafieeConverted,
        subhTimeConverted,
        date);
    final upcomingVaqthName = upcomingVaqthMap["Vaqth"];
    final upcomingVaqthTime = upcomingVaqthMap["DateTime"];

    final model = PrayerTimeModel(
      upcomingVaqthName,
      upcomingVaqthTime,
      zuhrTimeConverted,
      asruShafieeConverted,
      magribTimeConverted,
      ishauShafieeConverted,
      subhTimeConverted,
    );
    return model;
  }

  DateTime convertDecimalToDateTime(double decimalTime) {
    final hour = decimalTime.toInt().abs();

    final hourAfterDecimal = decimalTime - hour;

    final minute = hourAfterDecimal * 60;
    final minuteRounded = minute.toInt();
    final second = minute - minuteRounded;
    final secondCalculated = second * 60;
    final secondRounded = double.parse(
      secondCalculated.toStringAsFixed(0),
    );
    String hourString =
        hour.toString().length == 1 ? '0$hour' : hour.toString();

    String secondToInt = secondRounded.toInt().toString();
    String secondString =
        secondToInt.length == 1 ? '${secondToInt}0.0' : '$secondToInt.0';
    String year = DateTime.now().year.toString();
    String month = DateTime.now().month.toString();
    String day = DateTime.now().day.toString();

    String monthString = month.length == 1 ? '0$month' : month;
    String dayString = day.length == 1 ? '0$day' : day;

    String dateString =
        '$year-$monthString-$dayString $hourString:$minuteRounded:$secondString';
    // print(dateString);
    // String dateWithT = '${dateString.substring(8)}';
    // print(dateWithT);
    DateTime dateTime = DateTime.parse(dateString);
    // print('on Function $dateTime');
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

  Map<String, dynamic> getUpcomingVaqthandTime(DateTime zuhr, DateTime asr,
      DateTime magrib, DateTime isha, DateTime subh, DateTime currentTime) {
    if (currentTime.isAfter(subh)) {
      if (currentTime.isBefore(zuhr)) {
        return {"Vaqth": "Zuhr", "DateTime": zuhr};
      } else if (currentTime.isBefore(asr)) {
        return {"Vaqth": "Asr", "DateTime": asr};
      } else if (currentTime.isBefore(magrib)) {
        return {"Vaqth": "Magrib", "DateTime": magrib};
      } else if (currentTime.isBefore(isha)) {
        return {"Vaqth": "Isha", "DateTime": isha};
      } else {
        return {"Vaqth": "Subh", "DateTime": subh};
      }
    } else {
      return {"Vaqth": "Subh", "DateTime": subh};
    }
  }
}
