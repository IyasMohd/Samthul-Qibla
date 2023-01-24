// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:samthul_qibla/application/bloc/current_location_bloc.dart'
    as _i5;
import 'package:samthul_qibla/domain/current_location/current_location_repository.dart'
    as _i4;
import 'package:samthul_qibla/infrastructure/current_location/current_location_service.dart'
    as _i3;

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
    gh.factory<_i5.CurrentLocationBloc>(
        () => _i5.CurrentLocationBloc(gh<_i3.CurrentLocationService>()));
    return this;
  }
}
