import 'package:appointment/domain/client/entity.dart';
import 'package:appointment/domain/client/values.dart';
import 'package:appointment/domain/common/values.dart';
import 'package:appointment/domain/core/i_repository.dart';
import 'package:appointment/infrastructure/client/converter.dart';
import 'package:appointment/infrastructure/client/dao.dart';
import 'package:appointment/infrastructure/client/repository.dart';
import 'package:appointment/infrastructure/drift/db.dart';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'repositories_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ClientDao>(unsupportedMembers: {#table, #alias})
])
void main() {
  group("Client Repository", () {
    test(
        "Should call [ClientDao] insert only once "
        "when insert is called", () async {
      // Arrange
      final clientDao = MockClientDao();
      final client = Client.withoutUid(name: Name("Bob"));

      final sut = ClientRepository(clientDao, ClientConveter());

      // Act
      await sut.insert(client);

      // Assert
      verify(clientDao.insert(any)).called(1);
    });

    test(
        "Should call [ClientDao] insert with clientModelsCompanion"
        "when insert is called", () async {
      // Arrange
      final clientDao = MockClientDao();
      when(clientDao.insert(any)).thenAnswer((_) => Future.value(0));
      final client = Client.withoutUid(name: Name("Bob"));

      final sut = ClientRepository(clientDao, ClientConveter());

      // Act
      await sut.insert(client);

      // Assert
      expect(verify(clientDao.insert(captureAny)).captured.single,
          isA<UpdateCompanion<ClientModel>>());
    });

    test(
        "Should return client with correct id "
        "when insert is called", () async {
      // Arrange
      final client = Client.withoutUid(name: Name("Bob"));

      final clientDao = MockClientDao();
      const id = 1;
      when(clientDao.insert(any)).thenAnswer((_) => Future.value(id));

      final sut = ClientRepository(clientDao, ClientConveter());

      // Act
      final actual = await sut.insert(client);

      // Assert
      expect(actual, isA<Right<RepositoryFailure, Client>>());
      expect((actual as Right<RepositoryFailure, Client>).value.id,
          Uid.fromInt(id));
    });

    test(
        "Should return RepositoryFailure "
        "when insert is called "
        "and [ClientDao] throws exception", () async {
      // Arrange
      final client = Client.withoutUid(name: Name("Bob"));
      final clientDao = MockClientDao();
      when(clientDao.insert(any)).thenThrow(Exception("Mocked Exception"));

      final sut = ClientRepository(clientDao, ClientConveter());

      // Act
      final actual = await sut.insert(client);

      // Assert
      expect(actual, isA<Left<RepositoryFailure, Client>>());
      expect((actual as Left<RepositoryFailure, Client>).value,
          isA<RepositoryFailure>());
    });

    test(
        "Should call [ClientDao] updateById only once "
        "when update is called", () async {
      // Arrange
      final clientDao = MockClientDao();

      final client = Client.withoutUid(name: Name("Bob"));

      final sut = ClientRepository(clientDao, ClientConveter());

      // Act
      await sut.update(client);

      // Assert
      verify(clientDao.save(any, any)).called(1);
    });

    test(
        "Should call [ClientDao] updateById with clientModelsCompanion"
        "when update is called", () async {
      // Arrange
      final clientDao = MockClientDao();
      when(clientDao.save(any, any)).thenAnswer((_) => Future.value(true));
      final client = Client.withoutUid(name: Name("Bob"));

      final sut = ClientRepository(clientDao, ClientConveter());

      // Act
      await sut.update(client);

      // Assert
      expect(verify(clientDao.save(any, captureAny)).captured.single,
          isA<UpdateCompanion<ClientModel>>());
    });

    test(
        "Should return [RepositoryFailure] "
        "when updateById is called "
        "and [ClientDao] throws exception", () async {
      // Arrange
      final client = Client.withoutUid(name: Name("Bob"));
      final clientDao = MockClientDao();
      when(clientDao.save(any, any)).thenThrow(Exception("Mocked Exception"));

      final sut = ClientRepository(clientDao, ClientConveter());

      // Act
      final actual = await sut.update(client);

      // Assert
      expect(actual, isA<Left<RepositoryFailure, bool>>());
      expect((actual as Left<RepositoryFailure, bool>).value,
          isA<RepositoryFailure>());
    });

    test(
        "Should call [ClientDao] getById only once "
        "when getById is called "
        "and [ClientDao] returns client", () async {
      // Arrange
      final uid = Uid.fromInt(1);

      final model = ClientModel(
        id: uid.getOrThrow(),
        name: "Bob",
      );
      final clientDao = MockClientDao();
      when(clientDao.getById(any)).thenAnswer(
        (_) => Future.value(model),
      );

      final sut = ClientRepository(clientDao, ClientConveter());

      // Act
      final actual = await sut.getById(uid);

      // Assert
      expect(actual, isA<Right<RepositoryFailure, Client>>());
      expect((actual as Right<RepositoryFailure, Client>).value.id, uid);
      expect(actual.value.name, Name(model.name));
      verify(clientDao.getById(uid)).called(1);
    });
  });
}

extension Test on Either {
  T left<T>() => (this as Left).value;
  T right<T>() => (this as Right).value;
}
