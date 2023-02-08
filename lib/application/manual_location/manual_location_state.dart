part of 'manual_location_bloc.dart';

@freezed
class ManualLocationState with _$ManualLocationState {
  const factory ManualLocationState({
    required bool isDetailsEntered,
    required ManualLocationModel value,
  }) = _ManualLocationState;
  factory ManualLocationState.initial() {
    const initialState = ManualLocationState(
      isDetailsEntered: false,
        value: ManualLocationModel(
      samthulQibla: "0° 0' 0''",
      direction: '',
    ));
    return initialState;
  }
}
