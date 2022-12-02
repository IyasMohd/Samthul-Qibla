void splitThoolAndAral(double thoolOrAral) {
  final daraja = thoolOrAral.toInt();
  final darajaAfterDecimal = thoolOrAral - daraja;
  final daqeeqa = darajaAfterDecimal * 60;
  final daqeeqaRounded = daqeeqa.toInt();
  final thaniya = daqeeqa - daqeeqaRounded;
  final thaniyaCalculated = thaniya * 60;
  
}