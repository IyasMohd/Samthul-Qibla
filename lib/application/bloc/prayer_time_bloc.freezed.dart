// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prayer_time_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PrayerTimeEvent {
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
    required TResult Function(Initialize value) initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrayerTimeEventCopyWith<$Res> {
  factory $PrayerTimeEventCopyWith(
          PrayerTimeEvent value, $Res Function(PrayerTimeEvent) then) =
      _$PrayerTimeEventCopyWithImpl<$Res, PrayerTimeEvent>;
}

/// @nodoc
class _$PrayerTimeEventCopyWithImpl<$Res, $Val extends PrayerTimeEvent>
    implements $PrayerTimeEventCopyWith<$Res> {
  _$PrayerTimeEventCopyWithImpl(this._value, this._then);

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
    extends _$PrayerTimeEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializeImpl with DiagnosticableTreeMixin implements Initialize {
  const _$InitializeImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrayerTimeEvent.initialize()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PrayerTimeEvent.initialize'));
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
    required TResult Function(Initialize value) initialize,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class Initialize implements PrayerTimeEvent {
  const factory Initialize() = _$InitializeImpl;
}

/// @nodoc
mixin _$PrayerTimeState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  PrayerTimeModel get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PrayerTimeStateCopyWith<PrayerTimeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrayerTimeStateCopyWith<$Res> {
  factory $PrayerTimeStateCopyWith(
          PrayerTimeState value, $Res Function(PrayerTimeState) then) =
      _$PrayerTimeStateCopyWithImpl<$Res, PrayerTimeState>;
  @useResult
  $Res call({bool isLoading, bool isError, PrayerTimeModel value});
}

/// @nodoc
class _$PrayerTimeStateCopyWithImpl<$Res, $Val extends PrayerTimeState>
    implements $PrayerTimeStateCopyWith<$Res> {
  _$PrayerTimeStateCopyWithImpl(this._value, this._then);

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
              as PrayerTimeModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrayerTimeStateImplCopyWith<$Res>
    implements $PrayerTimeStateCopyWith<$Res> {
  factory _$$PrayerTimeStateImplCopyWith(_$PrayerTimeStateImpl value,
          $Res Function(_$PrayerTimeStateImpl) then) =
      __$$PrayerTimeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isError, PrayerTimeModel value});
}

/// @nodoc
class __$$PrayerTimeStateImplCopyWithImpl<$Res>
    extends _$PrayerTimeStateCopyWithImpl<$Res, _$PrayerTimeStateImpl>
    implements _$$PrayerTimeStateImplCopyWith<$Res> {
  __$$PrayerTimeStateImplCopyWithImpl(
      _$PrayerTimeStateImpl _value, $Res Function(_$PrayerTimeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? value = null,
  }) {
    return _then(_$PrayerTimeStateImpl(
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
              as PrayerTimeModel,
    ));
  }
}

/// @nodoc

class _$PrayerTimeStateImpl
    with DiagnosticableTreeMixin
    implements _PrayerTimeState {
  const _$PrayerTimeStateImpl(
      {required this.isLoading, required this.isError, required this.value});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final PrayerTimeModel value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrayerTimeState(isLoading: $isLoading, isError: $isError, value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrayerTimeState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isError', isError))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrayerTimeStateImpl &&
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
  _$$PrayerTimeStateImplCopyWith<_$PrayerTimeStateImpl> get copyWith =>
      __$$PrayerTimeStateImplCopyWithImpl<_$PrayerTimeStateImpl>(
          this, _$identity);
}

abstract class _PrayerTimeState implements PrayerTimeState {
  const factory _PrayerTimeState(
      {required final bool isLoading,
      required final bool isError,
      required final PrayerTimeModel value}) = _$PrayerTimeStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  PrayerTimeModel get value;
  @override
  @JsonKey(ignore: true)
  _$$PrayerTimeStateImplCopyWith<_$PrayerTimeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
