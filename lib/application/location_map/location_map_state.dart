part of 'location_map_bloc.dart';

@freezed
class LocationMapState with _$LocationMapState {
  const factory LocationMapState({
    required bool isLoading,
    required bool isError,
    required LocationMapModel value,
  }) = _LocationMapState;
  factory LocationMapState.initial() {
    const initialState = LocationMapModel(
        address: '', longitude: "0° 0' 0''", latittude: "0° 0' 0''");
    return  const LocationMapState(
        isLoading: false, isError: false, value: initialState);
  }
}
