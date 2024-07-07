class PrayerTimeModel {
  final String upcomingVaqth;
  final DateTime upcomingVaqthTime;
  final DateTime zuhrTime;
  final DateTime asrTime;
  final DateTime magribTime;
  final DateTime ishaTime;
  final DateTime subhTime;

  PrayerTimeModel(
    this.upcomingVaqth,
    this.upcomingVaqthTime,
    this.zuhrTime,
    this.asrTime,
    this.magribTime,
    this.ishaTime,
    this.subhTime,
  );
}
