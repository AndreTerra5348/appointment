// Mocks generated by Mockito 5.3.2 from annotations
// in appointment/test/presentation/home/home_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:appointment/infrastructure/drift/client/client_dao.dart' as _i5;
import 'package:appointment/infrastructure/drift/client/client_table.dart'
    as _i6;
import 'package:appointment/infrastructure/drift/core/select_filter.dart'
    as _i7;
import 'package:appointment/infrastructure/drift/drift_db.dart' as _i2;
import 'package:drift/drift.dart' as _i3;
import 'package:drift/src/runtime/executor/stream_queries.dart' as _i4;
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

class _FakeDriftDb_0 extends _i1.SmartFake implements _i2.DriftDb {
  _FakeDriftDb_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDatabaseConnection_1 extends _i1.SmartFake
    implements _i3.DatabaseConnection {
  _FakeDatabaseConnection_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDriftDatabaseOptions_2 extends _i1.SmartFake
    implements _i3.DriftDatabaseOptions {
  _FakeDriftDatabaseOptions_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeQueryExecutor_3 extends _i1.SmartFake implements _i3.QueryExecutor {
  _FakeQueryExecutor_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamQueryStore_4 extends _i1.SmartFake
    implements _i4.StreamQueryStore {
  _FakeStreamQueryStore_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDatabaseConnectionUser_5 extends _i1.SmartFake
    implements _i3.DatabaseConnectionUser {
  _FakeDatabaseConnectionUser_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _Fake$ClientModelsTable_6 extends _i1.SmartFake
    implements _i2.$ClientModelsTable {
  _Fake$ClientModelsTable_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSimpleSelectStatement_7<T extends _i3.HasResultSet, D>
    extends _i1.SmartFake implements _i3.SimpleSelectStatement<T, D> {
  _FakeSimpleSelectStatement_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDeleteStatement_8<T extends _i3.Table, D> extends _i1.SmartFake
    implements _i3.DeleteStatement<T, D> {
  _FakeDeleteStatement_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeInsertStatement_9<T extends _i3.Table, D> extends _i1.SmartFake
    implements _i3.InsertStatement<T, D> {
  _FakeInsertStatement_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUpdateStatement_10<T extends _i3.Table, D> extends _i1.SmartFake
    implements _i3.UpdateStatement<T, D> {
  _FakeUpdateStatement_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeJoinedSelectStatement_11<FirstT extends _i3.HasResultSet, FirstD>
    extends _i1.SmartFake implements _i3.JoinedSelectStatement<FirstT, FirstD> {
  _FakeJoinedSelectStatement_11(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSelectable_12<T> extends _i1.SmartFake implements _i3.Selectable<T> {
  _FakeSelectable_12(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGenerationContext_13 extends _i1.SmartFake
    implements _i3.GenerationContext {
  _FakeGenerationContext_13(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeClientModel_14 extends _i1.SmartFake implements _i2.ClientModel {
  _FakeClientModel_14(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResultSetImplementation_15<Tbl, Row> extends _i1.SmartFake
    implements _i3.ResultSetImplementation<Tbl, Row> {
  _FakeResultSetImplementation_15(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ClientDao].
///
/// See the documentation for Mockito's code generation for more information.
class MockClientDao extends _i1.Mock implements _i5.ClientDao {
  @override
  _i2.DriftDb get attachedDatabase => (super.noSuchMethod(
        Invocation.getter(#attachedDatabase),
        returnValue: _FakeDriftDb_0(
          this,
          Invocation.getter(#attachedDatabase),
        ),
        returnValueForMissingStub: _FakeDriftDb_0(
          this,
          Invocation.getter(#attachedDatabase),
        ),
      ) as _i2.DriftDb);
  @override
  _i3.DatabaseConnection get connection => (super.noSuchMethod(
        Invocation.getter(#connection),
        returnValue: _FakeDatabaseConnection_1(
          this,
          Invocation.getter(#connection),
        ),
        returnValueForMissingStub: _FakeDatabaseConnection_1(
          this,
          Invocation.getter(#connection),
        ),
      ) as _i3.DatabaseConnection);
  @override
  _i3.DriftDatabaseOptions get options => (super.noSuchMethod(
        Invocation.getter(#options),
        returnValue: _FakeDriftDatabaseOptions_2(
          this,
          Invocation.getter(#options),
        ),
        returnValueForMissingStub: _FakeDriftDatabaseOptions_2(
          this,
          Invocation.getter(#options),
        ),
      ) as _i3.DriftDatabaseOptions);
  @override
  _i3.QueryExecutor get executor => (super.noSuchMethod(
        Invocation.getter(#executor),
        returnValue: _FakeQueryExecutor_3(
          this,
          Invocation.getter(#executor),
        ),
        returnValueForMissingStub: _FakeQueryExecutor_3(
          this,
          Invocation.getter(#executor),
        ),
      ) as _i3.QueryExecutor);
  @override
  _i4.StreamQueryStore get streamQueries => (super.noSuchMethod(
        Invocation.getter(#streamQueries),
        returnValue: _FakeStreamQueryStore_4(
          this,
          Invocation.getter(#streamQueries),
        ),
        returnValueForMissingStub: _FakeStreamQueryStore_4(
          this,
          Invocation.getter(#streamQueries),
        ),
      ) as _i4.StreamQueryStore);
  @override
  _i3.DatabaseConnectionUser get resolvedEngine => (super.noSuchMethod(
        Invocation.getter(#resolvedEngine),
        returnValue: _FakeDatabaseConnectionUser_5(
          this,
          Invocation.getter(#resolvedEngine),
        ),
        returnValueForMissingStub: _FakeDatabaseConnectionUser_5(
          this,
          Invocation.getter(#resolvedEngine),
        ),
      ) as _i3.DatabaseConnectionUser);
  @override
  _i2.$ClientModelsTable get clientModels => (super.noSuchMethod(
        Invocation.getter(#clientModels),
        returnValue: _Fake$ClientModelsTable_6(
          this,
          Invocation.getter(#clientModels),
        ),
        returnValueForMissingStub: _Fake$ClientModelsTable_6(
          this,
          Invocation.getter(#clientModels),
        ),
      ) as _i2.$ClientModelsTable);
  @override
  _i3.SimpleSelectStatement<_i6.ClientModels, _i2.ClientModel> getSelect(
          {_i7.SelectFilter<_i6.ClientModels>? filter}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSelect,
          [],
          {#filter: filter},
        ),
        returnValue:
            _FakeSimpleSelectStatement_7<_i6.ClientModels, _i2.ClientModel>(
          this,
          Invocation.method(
            #getSelect,
            [],
            {#filter: filter},
          ),
        ),
        returnValueForMissingStub:
            _FakeSimpleSelectStatement_7<_i6.ClientModels, _i2.ClientModel>(
          this,
          Invocation.method(
            #getSelect,
            [],
            {#filter: filter},
          ),
        ),
      ) as _i3.SimpleSelectStatement<_i6.ClientModels, _i2.ClientModel>);
  @override
  _i3.DeleteStatement<_i6.ClientModels, _i2.ClientModel> getDelete() =>
      (super.noSuchMethod(
        Invocation.method(
          #getDelete,
          [],
        ),
        returnValue: _FakeDeleteStatement_8<_i6.ClientModels, _i2.ClientModel>(
          this,
          Invocation.method(
            #getDelete,
            [],
          ),
        ),
        returnValueForMissingStub:
            _FakeDeleteStatement_8<_i6.ClientModels, _i2.ClientModel>(
          this,
          Invocation.method(
            #getDelete,
            [],
          ),
        ),
      ) as _i3.DeleteStatement<_i6.ClientModels, _i2.ClientModel>);
  @override
  _i3.InsertStatement<_i6.ClientModels, _i2.ClientModel> getInsert() =>
      (super.noSuchMethod(
        Invocation.method(
          #getInsert,
          [],
        ),
        returnValue: _FakeInsertStatement_9<_i6.ClientModels, _i2.ClientModel>(
          this,
          Invocation.method(
            #getInsert,
            [],
          ),
        ),
        returnValueForMissingStub:
            _FakeInsertStatement_9<_i6.ClientModels, _i2.ClientModel>(
          this,
          Invocation.method(
            #getInsert,
            [],
          ),
        ),
      ) as _i3.InsertStatement<_i6.ClientModels, _i2.ClientModel>);
  @override
  _i3.UpdateStatement<_i6.ClientModels, _i2.ClientModel> getUpdate() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUpdate,
          [],
        ),
        returnValue: _FakeUpdateStatement_10<_i6.ClientModels, _i2.ClientModel>(
          this,
          Invocation.method(
            #getUpdate,
            [],
          ),
        ),
        returnValueForMissingStub:
            _FakeUpdateStatement_10<_i6.ClientModels, _i2.ClientModel>(
          this,
          Invocation.method(
            #getUpdate,
            [],
          ),
        ),
      ) as _i3.UpdateStatement<_i6.ClientModels, _i2.ClientModel>);
  @override
  _i8.Stream<List<Map<String, Object?>>> createStream(
          _i4.QueryStreamFetcher? stmt) =>
      (super.noSuchMethod(
        Invocation.method(
          #createStream,
          [stmt],
        ),
        returnValue: _i8.Stream<List<Map<String, Object?>>>.empty(),
        returnValueForMissingStub:
            _i8.Stream<List<Map<String, Object?>>>.empty(),
      ) as _i8.Stream<List<Map<String, Object?>>>);
  @override
  T alias<T extends _i3.Table, D>(
    _i3.TableInfo<T, D>? table,
    String? alias,
  ) =>
      throw UnsupportedError(
          '\'alias\' cannot be used without a mockito fallback generator.');
  @override
  void markTablesUpdated(Iterable<_i3.TableInfo<_i3.Table, dynamic>>? tables) =>
      super.noSuchMethod(
        Invocation.method(
          #markTablesUpdated,
          [tables],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyUpdates(Set<_i3.TableUpdate>? updates) => super.noSuchMethod(
        Invocation.method(
          #notifyUpdates,
          [updates],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Stream<Set<_i3.TableUpdate>> tableUpdates(
          [_i3.TableUpdateQuery? query = const _i3.TableUpdateQuery.any()]) =>
      (super.noSuchMethod(
        Invocation.method(
          #tableUpdates,
          [query],
        ),
        returnValue: _i8.Stream<Set<_i3.TableUpdate>>.empty(),
        returnValueForMissingStub: _i8.Stream<Set<_i3.TableUpdate>>.empty(),
      ) as _i8.Stream<Set<_i3.TableUpdate>>);
  @override
  _i8.Future<T> doWhenOpened<T>(
          _i8.FutureOr<T> Function(_i3.QueryExecutor)? fn) =>
      (super.noSuchMethod(
        Invocation.method(
          #doWhenOpened,
          [fn],
        ),
        returnValue: _i8.Future<T>.value(null),
        returnValueForMissingStub: _i8.Future<T>.value(null),
      ) as _i8.Future<T>);
  @override
  _i3.InsertStatement<T, D> into<T extends _i3.Table, D>(
          _i3.TableInfo<T, D>? table) =>
      (super.noSuchMethod(
        Invocation.method(
          #into,
          [table],
        ),
        returnValue: _FakeInsertStatement_9<T, D>(
          this,
          Invocation.method(
            #into,
            [table],
          ),
        ),
        returnValueForMissingStub: _FakeInsertStatement_9<T, D>(
          this,
          Invocation.method(
            #into,
            [table],
          ),
        ),
      ) as _i3.InsertStatement<T, D>);
  @override
  _i3.UpdateStatement<Tbl, R> update<Tbl extends _i3.Table, R>(
          _i3.TableInfo<Tbl, R>? table) =>
      (super.noSuchMethod(
        Invocation.method(
          #update,
          [table],
        ),
        returnValue: _FakeUpdateStatement_10<Tbl, R>(
          this,
          Invocation.method(
            #update,
            [table],
          ),
        ),
        returnValueForMissingStub: _FakeUpdateStatement_10<Tbl, R>(
          this,
          Invocation.method(
            #update,
            [table],
          ),
        ),
      ) as _i3.UpdateStatement<Tbl, R>);
  @override
  _i3.SimpleSelectStatement<T, R> select<T extends _i3.HasResultSet, R>(
    _i3.ResultSetImplementation<T, R>? table, {
    bool? distinct = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #select,
          [table],
          {#distinct: distinct},
        ),
        returnValue: _FakeSimpleSelectStatement_7<T, R>(
          this,
          Invocation.method(
            #select,
            [table],
            {#distinct: distinct},
          ),
        ),
        returnValueForMissingStub: _FakeSimpleSelectStatement_7<T, R>(
          this,
          Invocation.method(
            #select,
            [table],
            {#distinct: distinct},
          ),
        ),
      ) as _i3.SimpleSelectStatement<T, R>);
  @override
  _i3.JoinedSelectStatement<T, R> selectOnly<T extends _i3.HasResultSet, R>(
    _i3.ResultSetImplementation<T, R>? table, {
    bool? distinct = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #selectOnly,
          [table],
          {#distinct: distinct},
        ),
        returnValue: _FakeJoinedSelectStatement_11<T, R>(
          this,
          Invocation.method(
            #selectOnly,
            [table],
            {#distinct: distinct},
          ),
        ),
        returnValueForMissingStub: _FakeJoinedSelectStatement_11<T, R>(
          this,
          Invocation.method(
            #selectOnly,
            [table],
            {#distinct: distinct},
          ),
        ),
      ) as _i3.JoinedSelectStatement<T, R>);
  @override
  _i3.DeleteStatement<T, D> delete<T extends _i3.Table, D>(
          _i3.TableInfo<T, D>? table) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [table],
        ),
        returnValue: _FakeDeleteStatement_8<T, D>(
          this,
          Invocation.method(
            #delete,
            [table],
          ),
        ),
        returnValueForMissingStub: _FakeDeleteStatement_8<T, D>(
          this,
          Invocation.method(
            #delete,
            [table],
          ),
        ),
      ) as _i3.DeleteStatement<T, D>);
  @override
  _i8.Future<int> customUpdate(
    String? query, {
    List<_i3.Variable<Object>>? variables = const [],
    Set<_i3.TableInfo<_i3.Table, dynamic>>? updates,
    _i3.UpdateKind? updateKind,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #customUpdate,
          [query],
          {
            #variables: variables,
            #updates: updates,
            #updateKind: updateKind,
          },
        ),
        returnValue: _i8.Future<int>.value(0),
        returnValueForMissingStub: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);
  @override
  _i8.Future<int> customInsert(
    String? query, {
    List<_i3.Variable<Object>>? variables = const [],
    Set<_i3.TableInfo<_i3.Table, dynamic>>? updates,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #customInsert,
          [query],
          {
            #variables: variables,
            #updates: updates,
          },
        ),
        returnValue: _i8.Future<int>.value(0),
        returnValueForMissingStub: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);
  @override
  _i8.Future<List<_i3.QueryRow>> customWriteReturning(
    String? query, {
    List<_i3.Variable<Object>>? variables = const [],
    Set<_i3.TableInfo<_i3.Table, dynamic>>? updates,
    _i3.UpdateKind? updateKind,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #customWriteReturning,
          [query],
          {
            #variables: variables,
            #updates: updates,
            #updateKind: updateKind,
          },
        ),
        returnValue: _i8.Future<List<_i3.QueryRow>>.value(<_i3.QueryRow>[]),
        returnValueForMissingStub:
            _i8.Future<List<_i3.QueryRow>>.value(<_i3.QueryRow>[]),
      ) as _i8.Future<List<_i3.QueryRow>>);
  @override
  _i3.Selectable<_i3.QueryRow> customSelect(
    String? query, {
    List<_i3.Variable<Object>>? variables = const [],
    Set<_i3.ResultSetImplementation<dynamic, dynamic>>? readsFrom = const {},
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #customSelect,
          [query],
          {
            #variables: variables,
            #readsFrom: readsFrom,
          },
        ),
        returnValue: _FakeSelectable_12<_i3.QueryRow>(
          this,
          Invocation.method(
            #customSelect,
            [query],
            {
              #variables: variables,
              #readsFrom: readsFrom,
            },
          ),
        ),
        returnValueForMissingStub: _FakeSelectable_12<_i3.QueryRow>(
          this,
          Invocation.method(
            #customSelect,
            [query],
            {
              #variables: variables,
              #readsFrom: readsFrom,
            },
          ),
        ),
      ) as _i3.Selectable<_i3.QueryRow>);
  @override
  _i3.Selectable<_i3.QueryRow> customSelectQuery(
    String? query, {
    List<_i3.Variable<Object>>? variables = const [],
    Set<_i3.ResultSetImplementation<dynamic, dynamic>>? readsFrom = const {},
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #customSelectQuery,
          [query],
          {
            #variables: variables,
            #readsFrom: readsFrom,
          },
        ),
        returnValue: _FakeSelectable_12<_i3.QueryRow>(
          this,
          Invocation.method(
            #customSelectQuery,
            [query],
            {
              #variables: variables,
              #readsFrom: readsFrom,
            },
          ),
        ),
        returnValueForMissingStub: _FakeSelectable_12<_i3.QueryRow>(
          this,
          Invocation.method(
            #customSelectQuery,
            [query],
            {
              #variables: variables,
              #readsFrom: readsFrom,
            },
          ),
        ),
      ) as _i3.Selectable<_i3.QueryRow>);
  @override
  _i8.Future<void> customStatement(
    String? statement, [
    List<dynamic>? args,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #customStatement,
          [
            statement,
            args,
          ],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<T> transaction<T>(
    _i8.Future<T> Function()? action, {
    bool? requireNew = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #transaction,
          [action],
          {#requireNew: requireNew},
        ),
        returnValue: _i8.Future<T>.value(null),
        returnValueForMissingStub: _i8.Future<T>.value(null),
      ) as _i8.Future<T>);
  @override
  _i8.Future<void> batch(_i8.FutureOr<void> Function(_i3.Batch)? runInBatch) =>
      (super.noSuchMethod(
        Invocation.method(
          #batch,
          [runInBatch],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i3.GenerationContext $write(
    _i3.Component? component, {
    bool? hasMultipleTables,
    int? startIndex,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #$write,
          [component],
          {
            #hasMultipleTables: hasMultipleTables,
            #startIndex: startIndex,
          },
        ),
        returnValue: _FakeGenerationContext_13(
          this,
          Invocation.method(
            #$write,
            [component],
            {
              #hasMultipleTables: hasMultipleTables,
              #startIndex: startIndex,
            },
          ),
        ),
        returnValueForMissingStub: _FakeGenerationContext_13(
          this,
          Invocation.method(
            #$write,
            [component],
            {
              #hasMultipleTables: hasMultipleTables,
              #startIndex: startIndex,
            },
          ),
        ),
      ) as _i3.GenerationContext);
  @override
  _i3.GenerationContext $writeInsertable(
    _i3.TableInfo<_i3.Table, dynamic>? table,
    _i3.Insertable<dynamic>? insertable, {
    int? startIndex,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #$writeInsertable,
          [
            table,
            insertable,
          ],
          {#startIndex: startIndex},
        ),
        returnValue: _FakeGenerationContext_13(
          this,
          Invocation.method(
            #$writeInsertable,
            [
              table,
              insertable,
            ],
            {#startIndex: startIndex},
          ),
        ),
        returnValueForMissingStub: _FakeGenerationContext_13(
          this,
          Invocation.method(
            #$writeInsertable,
            [
              table,
              insertable,
            ],
            {#startIndex: startIndex},
          ),
        ),
      ) as _i3.GenerationContext);
  @override
  String $expandVar(
    int? start,
    int? amount,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #$expandVar,
          [
            start,
            amount,
          ],
        ),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i8.Future<int> insert(_i3.Insertable<_i2.ClientModel>? model) =>
      (super.noSuchMethod(
        Invocation.method(
          #insert,
          [model],
        ),
        returnValue: _i8.Future<int>.value(0),
        returnValueForMissingStub: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);
  @override
  _i8.Future<List<_i2.ClientModel>> getAll() => (super.noSuchMethod(
        Invocation.method(
          #getAll,
          [],
        ),
        returnValue:
            _i8.Future<List<_i2.ClientModel>>.value(<_i2.ClientModel>[]),
        returnValueForMissingStub:
            _i8.Future<List<_i2.ClientModel>>.value(<_i2.ClientModel>[]),
      ) as _i8.Future<List<_i2.ClientModel>>);
  @override
  _i8.Future<_i2.ClientModel> getByFilter(
          _i7.SelectFilter<_i6.ClientModels>? filter) =>
      (super.noSuchMethod(
        Invocation.method(
          #getByFilter,
          [filter],
        ),
        returnValue: _i8.Future<_i2.ClientModel>.value(_FakeClientModel_14(
          this,
          Invocation.method(
            #getByFilter,
            [filter],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.ClientModel>.value(_FakeClientModel_14(
          this,
          Invocation.method(
            #getByFilter,
            [filter],
          ),
        )),
      ) as _i8.Future<_i2.ClientModel>);
  @override
  _i8.Future<bool> save(
    _i7.SelectFilter<_i6.ClientModels>? filter,
    _i3.Insertable<_i2.ClientModel>? model,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #save,
          [
            filter,
            model,
          ],
        ),
        returnValue: _i8.Future<bool>.value(false),
        returnValueForMissingStub: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
  @override
  _i8.Future<bool> remove(_i7.SelectFilter<_i6.ClientModels>? filter) =>
      (super.noSuchMethod(
        Invocation.method(
          #remove,
          [filter],
        ),
        returnValue: _i8.Future<bool>.value(false),
        returnValueForMissingStub: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
}

/// A class which mocks [SimpleSelectStatement].
///
/// See the documentation for Mockito's code generation for more information.
class MockSimpleSelectStatement<T extends _i3.HasResultSet, D> extends _i1.Mock
    implements _i3.SimpleSelectStatement<T, D> {
  @override
  bool get distinct => (super.noSuchMethod(
        Invocation.getter(#distinct),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  Set<_i3.ResultSetImplementation<dynamic, dynamic>> get watchedTables =>
      (super.noSuchMethod(
        Invocation.getter(#watchedTables),
        returnValue: <_i3.ResultSetImplementation<dynamic, dynamic>>{},
        returnValueForMissingStub: <
            _i3.ResultSetImplementation<dynamic, dynamic>>{},
      ) as Set<_i3.ResultSetImplementation<dynamic, dynamic>>);
  @override
  _i3.DatabaseConnectionUser get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _FakeDatabaseConnectionUser_5(
          this,
          Invocation.getter(#database),
        ),
        returnValueForMissingStub: _FakeDatabaseConnectionUser_5(
          this,
          Invocation.getter(#database),
        ),
      ) as _i3.DatabaseConnectionUser);
  @override
  set database(_i3.DatabaseConnectionUser? _database) => super.noSuchMethod(
        Invocation.setter(
          #database,
          _database,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.ResultSetImplementation<T, D> get table => (super.noSuchMethod(
        Invocation.getter(#table),
        returnValue: _FakeResultSetImplementation_15<T, D>(
          this,
          Invocation.getter(#table),
        ),
        returnValueForMissingStub: _FakeResultSetImplementation_15<T, D>(
          this,
          Invocation.getter(#table),
        ),
      ) as _i3.ResultSetImplementation<T, D>);
  @override
  set table(_i3.ResultSetImplementation<T, D>? _table) => super.noSuchMethod(
        Invocation.setter(
          #table,
          _table,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set whereExpr(_i3.Where? _whereExpr) => super.noSuchMethod(
        Invocation.setter(
          #whereExpr,
          _whereExpr,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set orderByExpr(_i3.OrderBy? _orderByExpr) => super.noSuchMethod(
        Invocation.setter(
          #orderByExpr,
          _orderByExpr,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set limitExpr(_i3.Limit? _limitExpr) => super.noSuchMethod(
        Invocation.setter(
          #limitExpr,
          _limitExpr,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get writeReturningClause => (super.noSuchMethod(
        Invocation.getter(#writeReturningClause),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set writeReturningClause(bool? _writeReturningClause) => super.noSuchMethod(
        Invocation.setter(
          #writeReturningClause,
          _writeReturningClause,
        ),
        returnValueForMissingStub: null,
      );
  @override
  void writeStartPart(_i3.GenerationContext? ctx) => super.noSuchMethod(
        Invocation.method(
          #writeStartPart,
          [ctx],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<List<D>> get() => (super.noSuchMethod(
        Invocation.method(
          #get,
          [],
        ),
        returnValue: _i8.Future<List<D>>.value(<D>[]),
        returnValueForMissingStub: _i8.Future<List<D>>.value(<D>[]),
      ) as _i8.Future<List<D>>);
  @override
  _i8.Stream<List<D>> watch() => (super.noSuchMethod(
        Invocation.method(
          #watch,
          [],
        ),
        returnValue: _i8.Stream<List<D>>.empty(),
        returnValueForMissingStub: _i8.Stream<List<D>>.empty(),
      ) as _i8.Stream<List<D>>);
  @override
  _i3.JoinedSelectStatement<_i3.HasResultSet, dynamic> join(
          List<_i3.Join<_i3.HasResultSet, dynamic>>? joins) =>
      (super.noSuchMethod(
        Invocation.method(
          #join,
          [joins],
        ),
        returnValue: _FakeJoinedSelectStatement_11<_i3.HasResultSet, dynamic>(
          this,
          Invocation.method(
            #join,
            [joins],
          ),
        ),
        returnValueForMissingStub:
            _FakeJoinedSelectStatement_11<_i3.HasResultSet, dynamic>(
          this,
          Invocation.method(
            #join,
            [joins],
          ),
        ),
      ) as _i3.JoinedSelectStatement<_i3.HasResultSet, dynamic>);
  @override
  _i3.JoinedSelectStatement<_i3.HasResultSet, dynamic> addColumns(
          List<_i3.Expression<Object>>? expressions) =>
      (super.noSuchMethod(
        Invocation.method(
          #addColumns,
          [expressions],
        ),
        returnValue: _FakeJoinedSelectStatement_11<_i3.HasResultSet, dynamic>(
          this,
          Invocation.method(
            #addColumns,
            [expressions],
          ),
        ),
        returnValueForMissingStub:
            _FakeJoinedSelectStatement_11<_i3.HasResultSet, dynamic>(
          this,
          Invocation.method(
            #addColumns,
            [expressions],
          ),
        ),
      ) as _i3.JoinedSelectStatement<_i3.HasResultSet, dynamic>);
  @override
  void orderBy(List<_i3.OrderClauseGenerator<T>>? clauses) =>
      super.noSuchMethod(
        Invocation.method(
          #orderBy,
          [clauses],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void writeInto(_i3.GenerationContext? context) => super.noSuchMethod(
        Invocation.method(
          #writeInto,
          [context],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.GenerationContext constructQuery() => (super.noSuchMethod(
        Invocation.method(
          #constructQuery,
          [],
        ),
        returnValue: _FakeGenerationContext_13(
          this,
          Invocation.method(
            #constructQuery,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeGenerationContext_13(
          this,
          Invocation.method(
            #constructQuery,
            [],
          ),
        ),
      ) as _i3.GenerationContext);
  @override
  void where(_i3.Expression<bool> Function(T)? filter) => super.noSuchMethod(
        Invocation.method(
          #where,
          [filter],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void limit(
    int? limit, {
    int? offset,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #limit,
          [limit],
          {#offset: offset},
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<D> getSingle() => (super.noSuchMethod(
        Invocation.method(
          #getSingle,
          [],
        ),
        returnValue: _i8.Future<D>.value(null),
        returnValueForMissingStub: _i8.Future<D>.value(null),
      ) as _i8.Future<D>);
  @override
  _i8.Stream<D> watchSingle() => (super.noSuchMethod(
        Invocation.method(
          #watchSingle,
          [],
        ),
        returnValue: _i8.Stream<D>.empty(),
        returnValueForMissingStub: _i8.Stream<D>.empty(),
      ) as _i8.Stream<D>);
  @override
  _i8.Future<D?> getSingleOrNull() => (super.noSuchMethod(
        Invocation.method(
          #getSingleOrNull,
          [],
        ),
        returnValue: _i8.Future<D?>.value(),
        returnValueForMissingStub: _i8.Future<D?>.value(),
      ) as _i8.Future<D?>);
  @override
  _i8.Stream<D?> watchSingleOrNull() => (super.noSuchMethod(
        Invocation.method(
          #watchSingleOrNull,
          [],
        ),
        returnValue: _i8.Stream<D?>.empty(),
        returnValueForMissingStub: _i8.Stream<D?>.empty(),
      ) as _i8.Stream<D?>);
  @override
  _i3.Selectable<N> map<N>(N Function(D)? mapper) => (super.noSuchMethod(
        Invocation.method(
          #map,
          [mapper],
        ),
        returnValue: _FakeSelectable_12<N>(
          this,
          Invocation.method(
            #map,
            [mapper],
          ),
        ),
        returnValueForMissingStub: _FakeSelectable_12<N>(
          this,
          Invocation.method(
            #map,
            [mapper],
          ),
        ),
      ) as _i3.Selectable<N>);
  @override
  _i3.Selectable<N> asyncMap<N>(_i8.Future<N> Function(D)? mapper) =>
      (super.noSuchMethod(
        Invocation.method(
          #asyncMap,
          [mapper],
        ),
        returnValue: _FakeSelectable_12<N>(
          this,
          Invocation.method(
            #asyncMap,
            [mapper],
          ),
        ),
        returnValueForMissingStub: _FakeSelectable_12<N>(
          this,
          Invocation.method(
            #asyncMap,
            [mapper],
          ),
        ),
      ) as _i3.Selectable<N>);
}
