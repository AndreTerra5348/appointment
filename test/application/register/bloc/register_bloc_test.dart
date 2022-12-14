import 'package:appointment/application/client/register/client_register_validator.dart';
import 'package:appointment/application/register/bloc/register_bloc.dart';
import 'package:appointment/domain/client/client_entity.dart';
import 'package:appointment/domain/client/client_values.dart';
import 'package:appointment/domain/common/common_values.dart';
import 'package:appointment/infrastructure/drift/client/client_table.dart';
import 'package:appointment/infrastructure/drift/core/drift_repository.dart';
import 'package:appointment/infrastructure/drift/drift_db.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_bloc_test.mocks.dart';
import '../../../common/failure_fixture.dart' as failure_fixture;

@GenerateMocks([DriftRepository])
void main() {
  test("Initial state should be [State.initial()]", () {
    // Arrange
    final sut = RegisterBloc(
        MockDriftRepository<Client, ClientModels, ClientModel>(),
        ClientRegisterValidator());

    // Act
    // Assert
    expect(sut.state, RegisterState.initial());
  });

  group("Given [State.initial()]", () {
    late MockDriftRepository<Client, ClientModels, ClientModel> repository;
    late ClientRegisterValidator validator;
    late Client invalidClient;
    late Client validClient;

    setUp(() {
      invalidClient = Client.withoutUid(name: Name(""));
      validClient = Client(name: Name("name"), id: Uid.fromInt(1));
      repository = MockDriftRepository<Client, ClientModels, ClientModel>();
      validator = ClientRegisterValidator();
    });

    blocTest(
      "When [Event.submitted(client)] with invalid client"
      "Then [State.submissionStatus] is [failure()] "
      "And [SubmissionFailure] is [invalidFields()]",
      build: () => RegisterBloc(repository, validator),
      act: (bloc) => bloc.add(RegisterEvent.registered(entity: invalidClient)),
      expect: () => [RegisterState.invalidFieldFailure()],
    );

    blocTest(
      "When [Event.submitted(client)] with invalid client"
      "Then [State.submissionStatus] "
      "Then [Repository.insert()] should NOT be called",
      build: () => RegisterBloc(repository, validator),
      act: (bloc) => bloc.add(RegisterEvent.registered(entity: invalidClient)),
      verify: (_) => verifyNever(repository.insert(invalidClient)),
    );

    blocTest(
      "When [Event.submitted()] with valid client "
      "Then [Repository.insert()] should be called once",
      setUp: () {
        when(repository.insert(any))
            .thenAnswer((_) async => right(validClient));
      },
      build: () => RegisterBloc(repository, validator),
      act: (bloc) => bloc.add(RegisterEvent.registered(entity: validClient)),
      verify: (_) => verify(repository.insert(any)).called(1),
    );

    blocTest(
      "When [Repository.insert()] is called with valid client "
      "Then [State.submissionStatus] is [inProgress()] "
      "Then [State.submissionStatus] is [success()]",
      setUp: () {
        when(repository.insert(any))
            .thenAnswer((_) async => right(validClient));
      },
      build: () => RegisterBloc(repository, validator),
      act: (bloc) => bloc.add(RegisterEvent.registered(entity: validClient)),
      expect: () => [
        RegisterState.inProgress(),
        RegisterState.success(),
      ],
    );

    blocTest(
      "When [Repository.insert()] is called with valid client "
      "Then [State.submissionStatus] is [failure()] "
      "And [SubmissionFailure] is [failure()] "
      "And [RepositoryFailure] is [dbException()]",
      setUp: () {
        when(repository.insert(any)).thenAnswer(
          (_) async => const Left(
            failure_fixture.dbErrorRepositoryFailure,
          ),
        );
      },
      build: () => RegisterBloc(repository, validator),
      act: (bloc) => bloc.add(RegisterEvent.registered(entity: validClient)),
      skip: 1,
      expect: () => [
        RegisterState.repositoryFailure(
          failure: failure_fixture.dbErrorRepositoryFailure,
        ),
      ],
    );
  });
}
