import 'package:appointment/domain/common/value_object.dart';
import 'package:appointment/domain/core/i_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form.freezed.dart';

@freezed
class SubmissionStatus with _$SubmissionStatus {
  const SubmissionStatus._();
  const factory SubmissionStatus.initial() = _Initial;
  const factory SubmissionStatus.inProgress() = _InProgress;
  const factory SubmissionStatus.success() = _Success;
  const factory SubmissionStatus.failure({required SubmissionFailure failure}) =
      _Failure;
  const factory SubmissionStatus.canceled() = _Canceled;

  bool get isInitial => this is _Initial;
  bool get isInProgress => this is _InProgress;
  bool get isSuccess => this is _Success;
  bool get isFailure => this is _Failure;
  bool get isCanceled => this is _Canceled;
}

@freezed
class SubmissionFailure with _$SubmissionFailure {
  const factory SubmissionFailure.repository(
      {required RepositoryFailure failure}) = _Repository;
  const factory SubmissionFailure.invalidField() = _InvalidInput;
}

mixin FormMixin {
  /// Whether the [ValueObject] values are all valid.
  bool get isValid => values.every((element) => element.isValid);

  /// Whether the [ValueObject] values are not all valid.
  bool get isNotValid => !isValid;

  /// Returns all [ValueObject] instances.
  ///
  /// Override this and give it all [ValueObject]s in your class that should be
  /// validated automatically.
  List<ValueObject<dynamic, dynamic>> get values;
}
