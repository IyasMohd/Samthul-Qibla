import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:samthul_qibla/domain/prayer_time/model/prayer_time_model.dart';
import 'package:samthul_qibla/domain/prayer_time/prayer_time_service.dart';

part 'prayer_time_bloc.freezed.dart';
part 'prayer_time_event.dart';
part 'prayer_time_state.dart';

class PrayerTimeBloc extends Bloc<PrayerTimeEvent, PrayerTimeState> {
  final PrayerTimeService prayerTimeService;
  PrayerTimeBloc(this.prayerTimeService) : super(PrayerTimeState.initial()) {
    on(Initialize) => ((event, emit) async {
          emit(
            state.copyWith(
              isLoading: true,
              isError: false,
            ),
          );
          final PrayerTimeModel result = await prayerTimeService.initialize();

          emit(
            state.copyWith(
              isLoading: false,
              isError: false,
              value: result,
            ),
          );
        });
  }
}
