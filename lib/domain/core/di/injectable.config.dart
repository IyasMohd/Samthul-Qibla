// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:samthul_qibla/application/current_location/current_location_bloc.dart'
    as _i9;
import 'package:samthul_qibla/application/location_map/location_map_bloc.dart'
    as _i12;
import 'package:samthul_qibla/application/manual_location/manual_location_bloc.dart'
    as _i13;
import 'package:samthul_qibla/domain/current_location/current_location_service.dart'
    as _i5;
import 'package:samthul_qibla/domain/location_map/location_map_service.dart'
    as _i7;
import 'package:samthul_qibla/domain/manual_location/manual_location_service.dart'
    as _i3;
import 'package:samthul_qibla/domain/prayer_time/prayer_time_service.dart'
    as _i10;
import 'package:samthul_qibla/infrastructure/current_location/current_location_repository.dart'
    as _i6;
import 'package:samthul_qibla/infrastructure/location_map.dart/location_map_repository.dart'
    as _i8;
import 'package:samthul_qibla/infrastructure/manual_location/manual_location_repository.dart'
    as _i4;
import 'package:samthul_qibla/infrastructure/prayer_time/prayer_time_repository.dart'
    as _i11;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ManualLocationService>(
        () => _i4.ManualLocationRepository());
    gh.lazySingleton<_i5.CurrentLocationService>(
        () => _i6.CurrentLocationRepository());
    gh.lazySingleton<_i7.LocationMapService>(() => _i8.LocationMapRepository());
    gh.factory<_i9.CurrentLocationBloc>(
        () => _i9.CurrentLocationBloc(gh<_i5.CurrentLocationService>()));
    gh.lazySingleton<_i10.PrayerTimeService>(() => _i11.PrayerTimeRepository());
    gh.factory<_i12.LocationMapBloc>(
        () => _i12.LocationMapBloc(gh<_i7.LocationMapService>()));
    gh.factory<_i13.ManualLocationBloc>(
        () => _i13.ManualLocationBloc(gh<_i3.ManualLocationService>()));
    return this;
  }
}
