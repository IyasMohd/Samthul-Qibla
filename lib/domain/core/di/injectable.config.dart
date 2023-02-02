// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:samthul_qibla/application/current_location/current_location_bloc.dart'
    as _i9;
import 'package:samthul_qibla/application/location_map/location_map_bloc.dart'
    as _i10;
import 'package:samthul_qibla/application/manual_location/manual_location_bloc.dart'
    as _i11;
import 'package:samthul_qibla/domain/current_location/current_location_repository.dart'
    as _i4;
import 'package:samthul_qibla/domain/location_map/location_map_repository.dart'
    as _i6;
import 'package:samthul_qibla/domain/manual_location/manual_location_repository.dart'
    as _i8;
import 'package:samthul_qibla/infrastructure/current_location/current_location_service.dart'
    as _i3;
import 'package:samthul_qibla/infrastructure/location_map.dart/location_map_service.dart'
    as _i5;
import 'package:samthul_qibla/infrastructure/manual_location/manual_location_service.dart'
    as _i7;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.CurrentLocationService>(
        () => _i4.CurrentLocationRepository());
    gh.lazySingleton<_i5.LocationMapService>(() => _i6.LocationMapRepository());
    gh.lazySingleton<_i7.ManualLocationService>(
        () => _i8.ManualLocationRepository());
    gh.factory<_i9.CurrentLocationBloc>(
        () => _i9.CurrentLocationBloc(gh<_i3.CurrentLocationService>()));
    gh.factory<_i10.LocationMapBloc>(
        () => _i10.LocationMapBloc(gh<_i5.LocationMapService>()));
    gh.factory<_i11.ManualLocationBloc>(
        () => _i11.ManualLocationBloc(gh<_i7.ManualLocationService>()));
    return this;
  }
}
