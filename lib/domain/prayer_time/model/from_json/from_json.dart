class DeclinationAndTransit {
  int day;
  double sunDeclination;
  String ephemerisTransit;

  DeclinationAndTransit({
    required this.day,
    required this.sunDeclination,
    required this.ephemerisTransit,
  });

  factory DeclinationAndTransit.fromJson(Map<String, dynamic> json) =>
      DeclinationAndTransit(
        day: json['Day'] as int,
        sunDeclination: json['Sun Declination'] as double,
        ephemerisTransit: json['Ephemeris Transit'] as String,
      );
}
