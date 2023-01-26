import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:samthul_qibla/domain/core/failure/main_failure.dart';
import 'package:samthul_qibla/domain/location_map/models/location_map.dart';
import 'package:samthul_qibla/infrastructure/location_map.dart/location_map_service.dart';

part 'location_map_bloc.freezed.dart';
part 'location_map_event.dart';
part 'location_map_state.dart';


@injectable
class LocationMapBloc extends Bloc<LocationMapEvent, LocationMapState> {
  final LocationMapService locationMapService;

  LocationMapBloc(this.locationMapService) : super(LocationMapState.initial()) {
    on<LocationMapEvent>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      final Either<MainFailure, LocationMapModel> resultOption =
          await locationMapService.getSamthFromMap();
      emit(
        resultOption.fold(
          (failure) => state.copyWith(
            isError: true,
            isLoading: false,
          ),
          (success) => state.copyWith(
            isLoading: false,
            isError: false,
            value: success,
          ),
        ),
      );
    });
  }
}
