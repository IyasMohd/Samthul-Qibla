import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:samthul_qibla/domain/core/failure/main_failure.dart';
import 'package:samthul_qibla/domain/current_location/models/current_location_model.dart';
import 'package:samthul_qibla/domain/current_location/current_location_service.dart';

part 'current_location_bloc.freezed.dart';
part 'current_location_event.dart';
part 'current_location_state.dart';

@injectable
class CurrentLocationBloc
    extends Bloc<CurrentLocationEvent, CurrentLocationState> {
  final CurrentLocationService currentLocationService;
  CurrentLocationBloc(this.currentLocationService)
      : super(CurrentLocationState.initial()) {
    on<CurrentLocationEvent>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          isError: false,
        ),
      );

      final Either<MainFailure, CurrentLocationModel> resutlOption =
          await currentLocationService.getcurrentLocation();
      emit(
        resutlOption.fold(
          (failure) => state.copyWith(
            isLoading: false,
            isError: true,
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
