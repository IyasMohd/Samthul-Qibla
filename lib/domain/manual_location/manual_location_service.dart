import 'package:samthul_qibla/domain/manual_location/model/manual_location_model.dart';

abstract class ManualLocationService {
  ManualLocationModel getSamth(double aralulBalad, double thoolulBalad,
      bool directionEast, bool directionNorth);
}
