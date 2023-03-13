part of 'location_map_bloc.dart';

@freezed
class LocationMapEvent with _$LocationMapEvent {
  const factory LocationMapEvent.getSamthFromMap() = GetSamthFromMap;
  const factory LocationMapEvent.refreshUI() = RefreshUI;
}
