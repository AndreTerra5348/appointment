// Mocks generated by Mockito 5.3.2 from annotations
// in appointment/test/infrastructure/client/page_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:appointment/domain/common/values.dart' as _i5;
import 'package:appointment/infrastructure/core/dao.dart' as _i3;
import 'package:appointment/infrastructure/core/filter.dart' as _i6;
import 'package:drift/drift.dart' as _i1;
import 'package:mockito/mockito.dart' as _i2;

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

/// A class which mocks [Dao].
///
/// See the documentation for Mockito's code generation for more information.
class MockDao<T_Table extends _i1.Table, T_Model extends _i1.DataClass>
    extends _i2.Mock implements _i3.Dao<T_Table, T_Model> {
  @override
  T_Table get table => throw UnsupportedError(
      '\'table\' cannot be used without a mockito fallback generator.');
  @override
  _i4.Future<int> insert(_i1.Insertable<T_Model>? model) => (super.noSuchMethod(
        Invocation.method(
          #insert,
          [model],
        ),
        returnValue: _i4.Future<int>.value(0),
        returnValueForMissingStub: _i4.Future<int>.value(0),
      ) as _i4.Future<int>);
  @override
  _i4.Future<T_Model> getById(_i5.Uid? uid) => (super.noSuchMethod(
        Invocation.method(
          #getById,
          [uid],
        ),
        returnValue: _i4.Future<T_Model>.value(null),
        returnValueForMissingStub: _i4.Future<T_Model>.value(null),
      ) as _i4.Future<T_Model>);
  @override
  _i4.Future<Iterable<T_Model>> getPage({
    required int? limit,
    required int? offset,
    _i6.SelectFilter<T_Table, T_Model>? filter,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPage,
          [],
          {
            #limit: limit,
            #offset: offset,
            #filter: filter,
          },
        ),
        returnValue: _i4.Future<Iterable<T_Model>>.value(<T_Model>[]),
        returnValueForMissingStub:
            _i4.Future<Iterable<T_Model>>.value(<T_Model>[]),
      ) as _i4.Future<Iterable<T_Model>>);
  @override
  _i4.Future<bool> save(
    _i5.Uid? uid,
    _i1.Insertable<T_Model>? model,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #save,
          [
            uid,
            model,
          ],
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<bool> remove(_i5.Uid? uid) => (super.noSuchMethod(
        Invocation.method(
          #remove,
          [uid],
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}
