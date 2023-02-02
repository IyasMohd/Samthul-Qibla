part of 'manual_location_bloc.dart';

@freezed
class ManualLocationEvent with _$ManualLocationEvent {
  const factory ManualLocationEvent.getSamth({
    required double aralulBalad,
    required double thoolulBalad,
    required bool directionEast,
    required bool directionNorth,
  }) = _GetSamth;
}
