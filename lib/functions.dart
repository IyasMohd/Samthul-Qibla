import 'dart:math';

double samthulQibla(
    double aralulBalad, double araluMakka, double thoolulBalad) {
  // بعد القطر
  final jaibulAral = sin(aralulBalad * (pi / 180.0));
  final jaibulMail = sin(araluMakka * (pi / 180.0));
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

  final mabainathoolaini = mabainaTholaini(thoolulBalad);
  final thamamuMabainathoolaini = thamamuMabainaThoolaini(mabainathoolaini);
  final jaibuThamamuMabainaThoolaini =
      sin(thamamuMabainathoolaini * (pi / 180.0));

  //أصل معدل

  final aslMuaddal = aslMuthlaq * jaibuThamamuMabainaThoolaini;

  //جيب الإرتفاع

  final jaibulIrthifa = aslMuaddal + buadulQuthr;

  //قوس الإرتفاع

  final qousulIrthifa = asin(jaibulIrthifa) * (180.0 / pi);

  //حصة السمت

  final hissathuSamth = (jaibulIrthifa * jaibulAral) / jaibuThamamulAral;

  //جيب السعت

  final jaibuSsahath = jaibulMail / jaibuThamamulAral;

  //تعديل السمت

  final thaadeeluSamth = thaadeeluSsamth(hissathuSamth, jaibuSsahath);

  //تمام الإرتفاع

  final thamamulIrthifa = 90 - qousulIrthifa;

  //جيب تمام الإرتفاع

  final jaibuThamamulIrthifa = sin(thamamulIrthifa * (pi / 180.0));

  //جيب السمت

  final jaibuSamth = thaadeeluSamth / jaibuThamamulIrthifa;

  //قوس السمت

  final qousuSamth = asin(jaibuSamth) * (180.0 / pi);
  return qousuSamth;
}

String splitThoolAndAral(double thoolOrAral) {
  final daraja = thoolOrAral.toInt();
  final darajaAfterDecimal = thoolOrAral - daraja;
  final daqeeqa = darajaAfterDecimal * 60;
  final daqeeqaRounded = daqeeqa.toInt();
  final thaniya = daqeeqa - daqeeqaRounded;
  final thaniyaCalculated = thaniya * 60;
  return '$daraja,$daqeeqaRounded,$thaniyaCalculated';
}

double thamamuAralulbalad(double aralulBalad) {
  final thamamuAralulbalad = 90 - aralulBalad;
  return thamamuAralulbalad;
}

double mabainaTholaini(double thoolulBalad) {
  const thoolMakka = 39.9;

  if (thoolulBalad >= thoolMakka) {
    final mabainaThoolaini = thoolulBalad - thoolMakka;
    return mabainaThoolaini;
  } else {
    final mabainaThoolaini = thoolMakka - thoolulBalad;
    return mabainaThoolaini;
  }
}

double thamamuMabainaThoolaini(double mabainathoolaini) {
  final thamamuMabainaThoolaini = 90 - mabainathoolaini;
  return thamamuMabainaThoolaini;
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

double thaadeeluSsamth(double hissathuSamth, double jaibuSsahath) {
  if (hissathuSamth >= jaibuSsahath) {
    final thaadeeluSsamth = hissathuSamth - jaibuSsahath;
    return thaadeeluSsamth;
  } else {
    final thaadeeluSsamth = jaibuSsahath - hissathuSamth;
    return thaadeeluSsamth;
  }
}
