import 'package:dartz/dartz.dart';
import 'package:samthul_qibla/domain/core/failure/main_failure.dart';
import 'package:samthul_qibla/domain/location_map/models/location_map.dart';

abstract class LocationMapService {
  Future<Either<MainFailure, LocationMapModel>> getSamthFromMap();
}
