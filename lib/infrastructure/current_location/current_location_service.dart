import 'package:dartz/dartz.dart';
import 'package:samthul_qibla/domain/core/failure/main_failure.dart';
import 'package:samthul_qibla/domain/current_location/models/current_location_model.dart';

abstract class CurrentLocationService {
  Future<Either<MainFailure, CurrentLocationModel>> getcurrentLocation();
}
