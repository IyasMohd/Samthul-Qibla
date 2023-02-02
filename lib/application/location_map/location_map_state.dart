part of 'location_map_bloc.dart';

@freezed
class LocationMapState with _$LocationMapState {
  const factory LocationMapState({
    required bool isLoading,
    required bool isError,
    required LocationMapModel value,
    required AddressModel address,
  }) = _LocationMapState;
  factory LocationMapState.initial() {
    const initialState = LocationMapModel(
        longitude: "0° 0' 0''",
        latittude: "0° 0' 0''",
        samthulQibla: "0° 0' 0''");
    const initialAddress = AddressModel(address: '');
    return const LocationMapState(
      isLoading: false,
      isError: false,
      value: initialState,
      address: initialAddress,
    );
  }
}
