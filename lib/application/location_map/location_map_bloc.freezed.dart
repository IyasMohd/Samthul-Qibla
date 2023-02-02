// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_map_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocationMapEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSamthFromMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSamthFromMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSamthFromMap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSamthFromMap value) getSamthFromMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSamthFromMap value)? getSamthFromMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSamthFromMap value)? getSamthFromMap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationMapEventCopyWith<$Res> {
  factory $LocationMapEventCopyWith(
          LocationMapEvent value, $Res Function(LocationMapEvent) then) =
      _$LocationMapEventCopyWithImpl<$Res, LocationMapEvent>;
}

/// @nodoc
class _$LocationMapEventCopyWithImpl<$Res, $Val extends LocationMapEvent>
    implements $LocationMapEventCopyWith<$Res> {
  _$LocationMapEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetSamthFromMapCopyWith<$Res> {
  factory _$$_GetSamthFromMapCopyWith(
          _$_GetSamthFromMap value, $Res Function(_$_GetSamthFromMap) then) =
      __$$_GetSamthFromMapCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetSamthFromMapCopyWithImpl<$Res>
    extends _$LocationMapEventCopyWithImpl<$Res, _$_GetSamthFromMap>
    implements _$$_GetSamthFromMapCopyWith<$Res> {
  __$$_GetSamthFromMapCopyWithImpl(
      _$_GetSamthFromMap _value, $Res Function(_$_GetSamthFromMap) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetSamthFromMap implements _GetSamthFromMap {
  const _$_GetSamthFromMap();

  @override
  String toString() {
    return 'LocationMapEvent.getSamthFromMap()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetSamthFromMap);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSamthFromMap,
  }) {
    return getSamthFromMap();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSamthFromMap,
  }) {
    return getSamthFromMap?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSamthFromMap,
    required TResult orElse(),
  }) {
    if (getSamthFromMap != null) {
      return getSamthFromMap();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSamthFromMap value) getSamthFromMap,
  }) {
    return getSamthFromMap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSamthFromMap value)? getSamthFromMap,
  }) {
    return getSamthFromMap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSamthFromMap value)? getSamthFromMap,
    required TResult orElse(),
  }) {
    if (getSamthFromMap != null) {
      return getSamthFromMap(this);
    }
    return orElse();
  }
}

abstract class _GetSamthFromMap implements LocationMapEvent {
  const factory _GetSamthFromMap() = _$_GetSamthFromMap;
}

/// @nodoc
mixin _$LocationMapState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  LocationMapModel get value => throw _privateConstructorUsedError;
  AddressModel get address => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationMapStateCopyWith<LocationMapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationMapStateCopyWith<$Res> {
  factory $LocationMapStateCopyWith(
          LocationMapState value, $Res Function(LocationMapState) then) =
      _$LocationMapStateCopyWithImpl<$Res, LocationMapState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      LocationMapModel value,
      AddressModel address});
}

/// @nodoc
class _$LocationMapStateCopyWithImpl<$Res, $Val extends LocationMapState>
    implements $LocationMapStateCopyWith<$Res> {
  _$LocationMapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? value = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as LocationMapModel,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocationMapStateCopyWith<$Res>
    implements $LocationMapStateCopyWith<$Res> {
  factory _$$_LocationMapStateCopyWith(
          _$_LocationMapState value, $Res Function(_$_LocationMapState) then) =
      __$$_LocationMapStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      LocationMapModel value,
      AddressModel address});
}

/// @nodoc
class __$$_LocationMapStateCopyWithImpl<$Res>
    extends _$LocationMapStateCopyWithImpl<$Res, _$_LocationMapState>
    implements _$$_LocationMapStateCopyWith<$Res> {
  __$$_LocationMapStateCopyWithImpl(
      _$_LocationMapState _value, $Res Function(_$_LocationMapState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? value = null,
    Object? address = null,
  }) {
    return _then(_$_LocationMapState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as LocationMapModel,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
    ));
  }
}

/// @nodoc

class _$_LocationMapState implements _LocationMapState {
  const _$_LocationMapState(
      {required this.isLoading,
      required this.isError,
      required this.value,
      required this.address});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final LocationMapModel value;
  @override
  final AddressModel address;

  @override
  String toString() {
    return 'LocationMapState(isLoading: $isLoading, isError: $isError, value: $value, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationMapState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isError, value, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationMapStateCopyWith<_$_LocationMapState> get copyWith =>
      __$$_LocationMapStateCopyWithImpl<_$_LocationMapState>(this, _$identity);
}

abstract class _LocationMapState implements LocationMapState {
  const factory _LocationMapState(
      {required final bool isLoading,
      required final bool isError,
      required final LocationMapModel value,
      required final AddressModel address}) = _$_LocationMapState;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  LocationMapModel get value;
  @override
  AddressModel get address;
  @override
  @JsonKey(ignore: true)
  _$$_LocationMapStateCopyWith<_$_LocationMapState> get copyWith =>
      throw _privateConstructorUsedError;
}
