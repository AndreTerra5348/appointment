// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pagination_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaginationServiceFailure {
  Object get error => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object error) dbException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object error)? dbException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object error)? dbException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetPageDbException value) dbException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetPageDbException value)? dbException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetPageDbException value)? dbException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationServiceFailureCopyWith<PaginationServiceFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationServiceFailureCopyWith<$Res> {
  factory $PaginationServiceFailureCopyWith(PaginationServiceFailure value,
          $Res Function(PaginationServiceFailure) then) =
      _$PaginationServiceFailureCopyWithImpl<$Res, PaginationServiceFailure>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class _$PaginationServiceFailureCopyWithImpl<$Res,
        $Val extends PaginationServiceFailure>
    implements $PaginationServiceFailureCopyWith<$Res> {
  _$PaginationServiceFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      error: null == error ? _value.error : error,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetPageDbExceptionCopyWith<$Res>
    implements $PaginationServiceFailureCopyWith<$Res> {
  factory _$$_GetPageDbExceptionCopyWith(_$_GetPageDbException value,
          $Res Function(_$_GetPageDbException) then) =
      __$$_GetPageDbExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$_GetPageDbExceptionCopyWithImpl<$Res>
    extends _$PaginationServiceFailureCopyWithImpl<$Res, _$_GetPageDbException>
    implements _$$_GetPageDbExceptionCopyWith<$Res> {
  __$$_GetPageDbExceptionCopyWithImpl(
      _$_GetPageDbException _value, $Res Function(_$_GetPageDbException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_GetPageDbException(
      error: null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$_GetPageDbException implements _GetPageDbException {
  const _$_GetPageDbException({required this.error});

  @override
  final Object error;

  @override
  String toString() {
    return 'PaginationServiceFailure.dbException(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetPageDbException &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetPageDbExceptionCopyWith<_$_GetPageDbException> get copyWith =>
      __$$_GetPageDbExceptionCopyWithImpl<_$_GetPageDbException>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object error) dbException,
  }) {
    return dbException(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object error)? dbException,
  }) {
    return dbException?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object error)? dbException,
    required TResult orElse(),
  }) {
    if (dbException != null) {
      return dbException(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetPageDbException value) dbException,
  }) {
    return dbException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetPageDbException value)? dbException,
  }) {
    return dbException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetPageDbException value)? dbException,
    required TResult orElse(),
  }) {
    if (dbException != null) {
      return dbException(this);
    }
    return orElse();
  }
}

abstract class _GetPageDbException implements PaginationServiceFailure {
  const factory _GetPageDbException({required final Object error}) =
      _$_GetPageDbException;

  @override
  Object get error;
  @override
  @JsonKey(ignore: true)
  _$$_GetPageDbExceptionCopyWith<_$_GetPageDbException> get copyWith =>
      throw _privateConstructorUsedError;
}
