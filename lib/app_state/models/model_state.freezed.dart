// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ModelState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(AppException error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(AppException error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(AppException error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Success<T> value)? success,
    TResult? Function(_Error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelStateCopyWith<T, $Res> {
  factory $ModelStateCopyWith(
          ModelState<T> value, $Res Function(ModelState<T>) then) =
      _$ModelStateCopyWithImpl<T, $Res, ModelState<T>>;
}

/// @nodoc
class _$ModelStateCopyWithImpl<T, $Res, $Val extends ModelState<T>>
    implements $ModelStateCopyWith<T, $Res> {
  _$ModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<T, $Res> {
  factory _$$_InitialCopyWith(
          _$_Initial<T> value, $Res Function(_$_Initial<T>) then) =
      __$$_InitialCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<T, $Res>
    extends _$ModelStateCopyWithImpl<T, $Res, _$_Initial<T>>
    implements _$$_InitialCopyWith<T, $Res> {
  __$$_InitialCopyWithImpl(
      _$_Initial<T> _value, $Res Function(_$_Initial<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial<T> extends _Initial<T> {
  const _$_Initial() : super._();

  @override
  String toString() {
    return 'ModelState<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(AppException error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(AppException error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(AppException error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Error<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Success<T> value)? success,
    TResult? Function(_Error<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> extends ModelState<T> {
  const factory _Initial() = _$_Initial<T>;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$_LoadingCopyWith<T, $Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading<T> value, $Res Function(_$_Loading<T>) then) =
      __$$_LoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<T, $Res>
    extends _$ModelStateCopyWithImpl<T, $Res, _$_Loading<T>>
    implements _$$_LoadingCopyWith<T, $Res> {
  __$$_LoadingCopyWithImpl(
      _$_Loading<T> _value, $Res Function(_$_Loading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading<T> extends _Loading<T> {
  const _$_Loading() : super._();

  @override
  String toString() {
    return 'ModelState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(AppException error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(AppException error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(AppException error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Error<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Success<T> value)? success,
    TResult? Function(_Error<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading<T> extends ModelState<T> {
  const factory _Loading() = _$_Loading<T>;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$_SuccessCopyWith<T, $Res> {
  factory _$$_SuccessCopyWith(
          _$_Success<T> value, $Res Function(_$_Success<T>) then) =
      __$$_SuccessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<T, $Res>
    extends _$ModelStateCopyWithImpl<T, $Res, _$_Success<T>>
    implements _$$_SuccessCopyWith<T, $Res> {
  __$$_SuccessCopyWithImpl(
      _$_Success<T> _value, $Res Function(_$_Success<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_Success<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_Success<T> extends _Success<T> {
  const _$_Success(this.data) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'ModelState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessCopyWith<T, _$_Success<T>> get copyWith =>
      __$$_SuccessCopyWithImpl<T, _$_Success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(AppException error) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(AppException error)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(AppException error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Error<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Success<T> value)? success,
    TResult? Function(_Error<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success<T> extends ModelState<T> {
  const factory _Success(final T data) = _$_Success<T>;
  const _Success._() : super._();

  T get data;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<T, _$_Success<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<T, $Res> {
  factory _$$_ErrorCopyWith(
          _$_Error<T> value, $Res Function(_$_Error<T>) then) =
      __$$_ErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({AppException error});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<T, $Res>
    extends _$ModelStateCopyWithImpl<T, $Res, _$_Error<T>>
    implements _$$_ErrorCopyWith<T, $Res> {
  __$$_ErrorCopyWithImpl(_$_Error<T> _value, $Res Function(_$_Error<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_Error<T>(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }
}

/// @nodoc

class _$_Error<T> extends _Error<T> {
  const _$_Error(this.error) : super._();

  @override
  final AppException error;

  @override
  String toString() {
    return 'ModelState<$T>.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<T, _$_Error<T>> get copyWith =>
      __$$_ErrorCopyWithImpl<T, _$_Error<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(AppException error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(AppException error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(AppException error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Success<T> value)? success,
    TResult? Function(_Error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error<T> extends ModelState<T> {
  const factory _Error(final AppException error) = _$_Error<T>;
  const _Error._() : super._();

  AppException get error;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<T, _$_Error<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ModelActionState<S, T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(S action) loading,
    required TResult Function(T data) success,
    required TResult Function(AppException error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(S action)? loading,
    TResult? Function(T data)? success,
    TResult? Function(AppException error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(S action)? loading,
    TResult Function(T data)? success,
    TResult Function(AppException error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(__Initial<S, T> value) initial,
    required TResult Function(__Loading<S, T> value) loading,
    required TResult Function(__Success<S, T> value) success,
    required TResult Function(__Error<S, T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(__Initial<S, T> value)? initial,
    TResult? Function(__Loading<S, T> value)? loading,
    TResult? Function(__Success<S, T> value)? success,
    TResult? Function(__Error<S, T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(__Initial<S, T> value)? initial,
    TResult Function(__Loading<S, T> value)? loading,
    TResult Function(__Success<S, T> value)? success,
    TResult Function(__Error<S, T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelActionStateCopyWith<S, T, $Res> {
  factory $ModelActionStateCopyWith(ModelActionState<S, T> value,
          $Res Function(ModelActionState<S, T>) then) =
      _$ModelActionStateCopyWithImpl<S, T, $Res, ModelActionState<S, T>>;
}

/// @nodoc
class _$ModelActionStateCopyWithImpl<S, T, $Res,
        $Val extends ModelActionState<S, T>>
    implements $ModelActionStateCopyWith<S, T, $Res> {
  _$ModelActionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$__InitialCopyWith<S, T, $Res> {
  factory _$$__InitialCopyWith(
          _$__Initial<S, T> value, $Res Function(_$__Initial<S, T>) then) =
      __$$__InitialCopyWithImpl<S, T, $Res>;
}

/// @nodoc
class __$$__InitialCopyWithImpl<S, T, $Res>
    extends _$ModelActionStateCopyWithImpl<S, T, $Res, _$__Initial<S, T>>
    implements _$$__InitialCopyWith<S, T, $Res> {
  __$$__InitialCopyWithImpl(
      _$__Initial<S, T> _value, $Res Function(_$__Initial<S, T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$__Initial<S, T> extends __Initial<S, T> {
  const _$__Initial() : super._();

  @override
  String toString() {
    return 'ModelActionState<$S, $T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$__Initial<S, T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(S action) loading,
    required TResult Function(T data) success,
    required TResult Function(AppException error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(S action)? loading,
    TResult? Function(T data)? success,
    TResult? Function(AppException error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(S action)? loading,
    TResult Function(T data)? success,
    TResult Function(AppException error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(__Initial<S, T> value) initial,
    required TResult Function(__Loading<S, T> value) loading,
    required TResult Function(__Success<S, T> value) success,
    required TResult Function(__Error<S, T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(__Initial<S, T> value)? initial,
    TResult? Function(__Loading<S, T> value)? loading,
    TResult? Function(__Success<S, T> value)? success,
    TResult? Function(__Error<S, T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(__Initial<S, T> value)? initial,
    TResult Function(__Loading<S, T> value)? loading,
    TResult Function(__Success<S, T> value)? success,
    TResult Function(__Error<S, T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class __Initial<S, T> extends ModelActionState<S, T> {
  const factory __Initial() = _$__Initial<S, T>;
  const __Initial._() : super._();
}

/// @nodoc
abstract class _$$__LoadingCopyWith<S, T, $Res> {
  factory _$$__LoadingCopyWith(
          _$__Loading<S, T> value, $Res Function(_$__Loading<S, T>) then) =
      __$$__LoadingCopyWithImpl<S, T, $Res>;
  @useResult
  $Res call({S action});
}

/// @nodoc
class __$$__LoadingCopyWithImpl<S, T, $Res>
    extends _$ModelActionStateCopyWithImpl<S, T, $Res, _$__Loading<S, T>>
    implements _$$__LoadingCopyWith<S, T, $Res> {
  __$$__LoadingCopyWithImpl(
      _$__Loading<S, T> _value, $Res Function(_$__Loading<S, T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
  }) {
    return _then(_$__Loading<S, T>(
      freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as S,
    ));
  }
}

/// @nodoc

class _$__Loading<S, T> extends __Loading<S, T> {
  const _$__Loading(this.action) : super._();

  @override
  final S action;

  @override
  String toString() {
    return 'ModelActionState<$S, $T>.loading(action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$__Loading<S, T> &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$__LoadingCopyWith<S, T, _$__Loading<S, T>> get copyWith =>
      __$$__LoadingCopyWithImpl<S, T, _$__Loading<S, T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(S action) loading,
    required TResult Function(T data) success,
    required TResult Function(AppException error) error,
  }) {
    return loading(action);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(S action)? loading,
    TResult? Function(T data)? success,
    TResult? Function(AppException error)? error,
  }) {
    return loading?.call(action);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(S action)? loading,
    TResult Function(T data)? success,
    TResult Function(AppException error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(action);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(__Initial<S, T> value) initial,
    required TResult Function(__Loading<S, T> value) loading,
    required TResult Function(__Success<S, T> value) success,
    required TResult Function(__Error<S, T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(__Initial<S, T> value)? initial,
    TResult? Function(__Loading<S, T> value)? loading,
    TResult? Function(__Success<S, T> value)? success,
    TResult? Function(__Error<S, T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(__Initial<S, T> value)? initial,
    TResult Function(__Loading<S, T> value)? loading,
    TResult Function(__Success<S, T> value)? success,
    TResult Function(__Error<S, T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class __Loading<S, T> extends ModelActionState<S, T> {
  const factory __Loading(final S action) = _$__Loading<S, T>;
  const __Loading._() : super._();

  S get action;
  @JsonKey(ignore: true)
  _$$__LoadingCopyWith<S, T, _$__Loading<S, T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$__SuccessCopyWith<S, T, $Res> {
  factory _$$__SuccessCopyWith(
          _$__Success<S, T> value, $Res Function(_$__Success<S, T>) then) =
      __$$__SuccessCopyWithImpl<S, T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$__SuccessCopyWithImpl<S, T, $Res>
    extends _$ModelActionStateCopyWithImpl<S, T, $Res, _$__Success<S, T>>
    implements _$$__SuccessCopyWith<S, T, $Res> {
  __$$__SuccessCopyWithImpl(
      _$__Success<S, T> _value, $Res Function(_$__Success<S, T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$__Success<S, T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$__Success<S, T> extends __Success<S, T> {
  const _$__Success(this.data) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'ModelActionState<$S, $T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$__Success<S, T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$__SuccessCopyWith<S, T, _$__Success<S, T>> get copyWith =>
      __$$__SuccessCopyWithImpl<S, T, _$__Success<S, T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(S action) loading,
    required TResult Function(T data) success,
    required TResult Function(AppException error) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(S action)? loading,
    TResult? Function(T data)? success,
    TResult? Function(AppException error)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(S action)? loading,
    TResult Function(T data)? success,
    TResult Function(AppException error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(__Initial<S, T> value) initial,
    required TResult Function(__Loading<S, T> value) loading,
    required TResult Function(__Success<S, T> value) success,
    required TResult Function(__Error<S, T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(__Initial<S, T> value)? initial,
    TResult? Function(__Loading<S, T> value)? loading,
    TResult? Function(__Success<S, T> value)? success,
    TResult? Function(__Error<S, T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(__Initial<S, T> value)? initial,
    TResult Function(__Loading<S, T> value)? loading,
    TResult Function(__Success<S, T> value)? success,
    TResult Function(__Error<S, T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class __Success<S, T> extends ModelActionState<S, T> {
  const factory __Success(final T data) = _$__Success<S, T>;
  const __Success._() : super._();

  T get data;
  @JsonKey(ignore: true)
  _$$__SuccessCopyWith<S, T, _$__Success<S, T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$__ErrorCopyWith<S, T, $Res> {
  factory _$$__ErrorCopyWith(
          _$__Error<S, T> value, $Res Function(_$__Error<S, T>) then) =
      __$$__ErrorCopyWithImpl<S, T, $Res>;
  @useResult
  $Res call({AppException error});
}

/// @nodoc
class __$$__ErrorCopyWithImpl<S, T, $Res>
    extends _$ModelActionStateCopyWithImpl<S, T, $Res, _$__Error<S, T>>
    implements _$$__ErrorCopyWith<S, T, $Res> {
  __$$__ErrorCopyWithImpl(
      _$__Error<S, T> _value, $Res Function(_$__Error<S, T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$__Error<S, T>(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }
}

/// @nodoc

class _$__Error<S, T> extends __Error<S, T> {
  const _$__Error(this.error) : super._();

  @override
  final AppException error;

  @override
  String toString() {
    return 'ModelActionState<$S, $T>.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$__Error<S, T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$__ErrorCopyWith<S, T, _$__Error<S, T>> get copyWith =>
      __$$__ErrorCopyWithImpl<S, T, _$__Error<S, T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(S action) loading,
    required TResult Function(T data) success,
    required TResult Function(AppException error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(S action)? loading,
    TResult? Function(T data)? success,
    TResult? Function(AppException error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(S action)? loading,
    TResult Function(T data)? success,
    TResult Function(AppException error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(__Initial<S, T> value) initial,
    required TResult Function(__Loading<S, T> value) loading,
    required TResult Function(__Success<S, T> value) success,
    required TResult Function(__Error<S, T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(__Initial<S, T> value)? initial,
    TResult? Function(__Loading<S, T> value)? loading,
    TResult? Function(__Success<S, T> value)? success,
    TResult? Function(__Error<S, T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(__Initial<S, T> value)? initial,
    TResult Function(__Loading<S, T> value)? loading,
    TResult Function(__Success<S, T> value)? success,
    TResult Function(__Error<S, T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class __Error<S, T> extends ModelActionState<S, T> {
  const factory __Error(final AppException error) = _$__Error<S, T>;
  const __Error._() : super._();

  AppException get error;
  @JsonKey(ignore: true)
  _$$__ErrorCopyWith<S, T, _$__Error<S, T>> get copyWith =>
      throw _privateConstructorUsedError;
}
