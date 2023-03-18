import 'package:samthul_qibla/domain/prayer_time/model/prayer_time_model.dart';

abstract class PrayerTimeService {
  Future<PrayerTimeModel> initialize();
}
