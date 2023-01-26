part of 'current_location_bloc.dart';

@freezed
class CurrentLocationState with _$CurrentLocationState {
  const factory CurrentLocationState({
    required bool isLoading,
    required bool isError,
    required CurrentLocationModel value,
  }) = _CurrentLocationState;
  factory CurrentLocationState.initial() {
    const initialState = CurrentLocationModel(
        address: '', longitude: "0° 0' 0''", latittude: "0° 0' 0''");
    return const CurrentLocationState(
      isLoading: false,
      isError: false,
      value: initialState,
    );
  }
}
