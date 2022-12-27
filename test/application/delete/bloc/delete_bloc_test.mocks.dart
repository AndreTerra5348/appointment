// Mocks generated by Mockito 5.3.2 from annotations
// in appointment/test/application/delete/bloc/delete_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:appointment/domain/common/common_values.dart' as _i8;
import 'package:appointment/domain/common/entity_mixin.dart' as _i3;
import 'package:appointment/domain/core/repository.dart' as _i7;
import 'package:appointment/infrastructure/drift/core/drift_repository.dart'
    as _i5;
import 'package:dartz/dartz.dart' as _i2;
import 'package:drift/drift.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DriftRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockDriftRepository<
        T_Entity extends _i3.EntityMixin,
        T_Table extends _i4.Table,
        T_Model extends _i4.DataClass> extends _i1.Mock
    implements _i5.DriftRepository<T_Entity, T_Table, T_Model> {
  MockDriftRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.RepositoryFailure, T_Entity>> insert(
          T_Entity? entity) =>
      (super.noSuchMethod(
        Invocation.method(
          #insert,
          [entity],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.RepositoryFailure, T_Entity>>.value(
                _FakeEither_0<_i7.RepositoryFailure, T_Entity>(
          this,
          Invocation.method(
            #insert,
            [entity],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.RepositoryFailure, T_Entity>>);
  @override
  _i6.Future<_i2.Either<_i7.RepositoryFailure, bool>> update(
          T_Entity? entity) =>
      (super.noSuchMethod(
        Invocation.method(
          #update,
          [entity],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.RepositoryFailure, bool>>.value(
            _FakeEither_0<_i7.RepositoryFailure, bool>(
          this,
          Invocation.method(
            #update,
            [entity],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.RepositoryFailure, bool>>);
  @override
  _i6.Future<_i2.Either<_i7.RepositoryFailure, T_Entity>> getById(
          _i8.Uid? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getById,
          [id],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.RepositoryFailure, T_Entity>>.value(
                _FakeEither_0<_i7.RepositoryFailure, T_Entity>(
          this,
          Invocation.method(
            #getById,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.RepositoryFailure, T_Entity>>);
  @override
  _i6.Future<_i2.Either<_i7.RepositoryFailure, bool>> delete(_i8.Uid? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.RepositoryFailure, bool>>.value(
            _FakeEither_0<_i7.RepositoryFailure, bool>(
          this,
          Invocation.method(
            #delete,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.RepositoryFailure, bool>>);
}
