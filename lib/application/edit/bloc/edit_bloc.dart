/// Defines [EditBloc] for [EntityMixin]
import 'dart:async';

import 'package:appointment/application/common/submission_status.dart';
import 'package:appointment/domain/common/entity_mixin.dart';
import 'package:appointment/domain/core/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_event.dart';
part 'edit_state.dart';
part 'edit_bloc.freezed.dart';

/// Handle [EntityMixin] editing
class EditBloc<T extends EntityMixin> extends Bloc<EditEvent<T>, EditState> {
  final Repository<T> _repository;
  EditBloc(this._repository) : super(const _Initial()) {
    on<_EditPressed<T>>(_onEditPressed);
    on<_SavePressed<T>>(_onSavePressed);
    on<_CancelPressed<T>>(_onCancelPressed);
  }

  FutureOr<void> _onEditPressed(
      _EditPressed<T> event, Emitter<EditState> emit) {
    emit(const EditState.editing());
  }

  FutureOr<void> _onSavePressed(
      _SavePressed<T> event, Emitter<EditState> emit) async {
    emit(
      event.entity.validity.fold(
        () => EditState.invalidFieldFailure(),
        (_) => const EditState.inProgress(),
      ),
    );

    if (state.isFailure) return;

    final result = await _repository.update(event.entity);

    emit(
      result.fold(
        (failure) => EditState.repositoryFailure(failure: failure),
        (completed) =>
            completed ? const EditState.success() : EditState.notFoundFailure(),
      ),
    );
  }

  FutureOr<void> _onCancelPressed(
      _CancelPressed<T> event, Emitter<EditState> emit) {
    emit(const EditState.initial());
  }
}
