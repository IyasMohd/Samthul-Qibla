import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:samthul_qibla/domain/manual_location/manual_location_service.dart';
import 'package:samthul_qibla/domain/manual_location/model/manual_location_model.dart';

part 'manual_location_bloc.freezed.dart';
part 'manual_location_event.dart';
part 'manual_location_state.dart';

@injectable
class ManualLocationBloc
    extends Bloc<ManualLocationEvent, ManualLocationState> {
  final ManualLocationService manualLocationService;

  ManualLocationBloc(this.manualLocationService)
      : super(ManualLocationState.initial()) {
    on<GetSamth>((event, emit) {
      emit(
        state.copyWith(
          value: const ManualLocationModel(
            samthulQibla: "0° 0' 0''",
            direction: '',
          ),
        ),
      );
      final ManualLocationModel result = manualLocationService.getSamth(
        event.aralulBalad,
        event.thoolulBalad,
        event.directionEast,
        event.directionNorth,
      );
      emit(
        state.copyWith(
          isDetailsEntered: true,
          value: result,
        ),
      );
    });
    on<RefreshUI>((event, emit) {
      emit(state.copyWith(isDetailsEntered: false));
    });
  }
}
