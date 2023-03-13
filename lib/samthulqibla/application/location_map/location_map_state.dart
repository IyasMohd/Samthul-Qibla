part of 'location_map_bloc.dart';

@freezed
class LocationMapState with _$LocationMapState {
  const factory LocationMapState({
    required bool isLocationSelected,
    required bool isLoading,
    required bool isError,
    required LocationMapModel value,
    required AddressModel address,
  }) = _LocationMapState;
  factory LocationMapState.initial() {
    const initialState = LocationMapModel(
      longitude: "-° -' -''",
      latittude: "-° -' -''",
      samthulQibla: "-° -' -''",
    );
    const initialAddress = AddressModel(address: '');
    return const LocationMapState(
      isLocationSelected: false,
      isLoading: false,
      isError: false,
      value: initialState,
      address: initialAddress,
    );
  }
}
