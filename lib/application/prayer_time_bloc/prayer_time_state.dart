part of 'prayer_time_bloc.dart';

@freezed
class PrayerTimeState with _$PrayerTimeState {
  const factory PrayerTimeState({
    required bool isLoading,
    required bool isError,
    required PrayerTimeModel value,
  }) = _PrayerTimeState;
  factory PrayerTimeState.initial() {
     final initialState = PrayerTimeModel(
      DateTime.now(),
      DateTime.now(),
      DateTime.now(),
      DateTime.now(),
      DateTime.now(),
    );
    return PrayerTimeState(
        isLoading: true, isError: false, value: initialState);
  }
}
