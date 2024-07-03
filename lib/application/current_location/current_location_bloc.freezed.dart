// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_location_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrentLocationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentLocationEventCopyWith<$Res> {
  factory $CurrentLocationEventCopyWith(CurrentLocationEvent value,
          $Res Function(CurrentLocationEvent) then) =
      _$CurrentLocationEventCopyWithImpl<$Res, CurrentLocationEvent>;
}

/// @nodoc
class _$CurrentLocationEventCopyWithImpl<$Res,
        $Val extends CurrentLocationEvent>
    implements $CurrentLocationEventCopyWith<$Res> {
  _$CurrentLocationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$CurrentLocationEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'CurrentLocationEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements CurrentLocationEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
mixin _$CurrentLocationState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  CurrentLocationModel get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentLocationStateCopyWith<CurrentLocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentLocationStateCopyWith<$Res> {
  factory $CurrentLocationStateCopyWith(CurrentLocationState value,
          $Res Function(CurrentLocationState) then) =
      _$CurrentLocationStateCopyWithImpl<$Res, CurrentLocationState>;
  @useResult
  $Res call({bool isLoading, bool isError, CurrentLocationModel value});
}

/// @nodoc
class _$CurrentLocationStateCopyWithImpl<$Res,
        $Val extends CurrentLocationState>
    implements $CurrentLocationStateCopyWith<$Res> {
  _$CurrentLocationStateCopyWithImpl(this._value, this._then);

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
              as CurrentLocationModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentLocationStateImplCopyWith<$Res>
    implements $CurrentLocationStateCopyWith<$Res> {
  factory _$$CurrentLocationStateImplCopyWith(_$CurrentLocationStateImpl value,
          $Res Function(_$CurrentLocationStateImpl) then) =
      __$$CurrentLocationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isError, CurrentLocationModel value});
}

/// @nodoc
class __$$CurrentLocationStateImplCopyWithImpl<$Res>
    extends _$CurrentLocationStateCopyWithImpl<$Res, _$CurrentLocationStateImpl>
    implements _$$CurrentLocationStateImplCopyWith<$Res> {
  __$$CurrentLocationStateImplCopyWithImpl(_$CurrentLocationStateImpl _value,
      $Res Function(_$CurrentLocationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? value = null,
  }) {
    return _then(_$CurrentLocationStateImpl(
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
              as CurrentLocationModel,
    ));
  }
}

/// @nodoc

class _$CurrentLocationStateImpl implements _CurrentLocationState {
  const _$CurrentLocationStateImpl(
      {required this.isLoading, required this.isError, required this.value});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final CurrentLocationModel value;

  @override
  String toString() {
    return 'CurrentLocationState(isLoading: $isLoading, isError: $isError, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentLocationStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentLocationStateImplCopyWith<_$CurrentLocationStateImpl>
      get copyWith =>
          __$$CurrentLocationStateImplCopyWithImpl<_$CurrentLocationStateImpl>(
              this, _$identity);
}

abstract class _CurrentLocationState implements CurrentLocationState {
  const factory _CurrentLocationState(
      {required final bool isLoading,
      required final bool isError,
      required final CurrentLocationModel value}) = _$CurrentLocationStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  CurrentLocationModel get value;
  @override
  @JsonKey(ignore: true)
  _$$CurrentLocationStateImplCopyWith<_$CurrentLocationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
