import 'package:appointment/application/client/search/bloc/bloc.dart';
import 'package:appointment/application/common/pagination.dart';
import 'package:appointment/domain/client/entity.dart';
import 'package:appointment/domain/client/values.dart';
import 'package:appointment/domain/common/values.dart';
import 'package:appointment/infrastructure/client/filter.dart';
import 'package:appointment/infrastructure/client/page_service.dart';
import 'package:appointment/infrastructure/core/i_page_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ClientPageService>(),
])
void main() {
  group("ClientSearchBloc - ", () {
    group("Initial Values -", initialValuesTests);
    group("Events -", eventsTests);
  });
}

void initialValuesTests() {
  test("Initial state should be [ClientSearchBloc.initial()]", () {
    // Arrange
    final sut = _createSut();
    // Act

    //Assert
    expect(sut.state, ClientSearchState.initial());
  });

  test("[ClientSearchBloc.initial().term] should be empty", () {
    // Arrange
    final sut = _createSut();
    // Act

    //Assert
    expect(sut.state.term, isEmpty);
  });

  test("[ClientSearchBloc.initial().isLoading] should be true", () {
    // Arrange
    final sut = _createSut();
    // Act

    //Assert
    expect(sut.state.isLoading, isTrue);
  });

  test(
      "[ClientSearchBloc.initial().SearchFilter]  should be [SearchFilter.name()]",
      () {
    // Arrange
    final sut = _createSut();
    // Act

    //Assert
    expect(sut.state.filter, const SearchFilter.name());
  });

  test(
      "[ClientSearchBloc.initial().getFilter()]  should return ClientNameFilter",
      () {
    // Arrange
    final sut = _createSut();
    // Act

    //Assert
    expect(sut.state.getFilter(), isA<ClientNameFilter>());
  });

  test(
      "[ClientSearchBloc.initial().pagination] should return [Pagination.empty()]",
      () {
    // Arrange
    final sut = _createSut();
    // Act

    //Assert
    expect(sut.state.pagination, Pagination.empty());
  });
}

void eventsTests() {
  const term = "Bob";
  late MockClientPageService pageService;
  late Iterable<Client> clients;
  late PageServiceFailure failure;

  blocTest(
    """Emit [ClientSearchState] with:
    [isLoading] equal to true.
    call [PageService.getPage()] once
    then emit [ClientSearchState] with:
    [isLoading] equal to false
    and [clients] equal to client's next page
    when [nextPageRequested()] is added""",
    setUp: () {
      pageService = MockClientPageService();
      clients = _createClients();
      when(pageService.getPage(
        limit: anyNamed("limit"),
        offset: anyNamed("offset"),
        filter: anyNamed("filter"),
      )).thenAnswer((_) async => Right(clients));
    },
    build: () => _createSut(pageService: pageService),
    act: (bloc) => bloc.add(const ClientSearchEvent.nextPageRequested()),
    expect: () => [
      ClientSearchState.initial().copyWith(
        isLoading: true,
      ),
      ClientSearchState.initial().copyWith(
        isLoading: false,
        clients: clients,
      )
    ],
    verify: (bloc) => verify(pageService.getPage(
      limit: anyNamed("limit"),
      offset: anyNamed("offset"),
      filter: anyNamed("filter"),
    )).called(1),
  );

  blocTest(
    """Emit [ClientSearchState] with:
      [isLoading] equal to false
      and failure equal to [PageServiceFailure]
      when [nextPageRequested()] is added 
      and [PageService.getPage()] fails""",
    setUp: () {
      pageService = MockClientPageService();
      failure =
          PageServiceFailure.getPageDbException(error: Exception("error"));
      when(pageService.getPage(
        limit: anyNamed("limit"),
        offset: anyNamed("offset"),
        filter: anyNamed("filter"),
      )).thenAnswer((_) async => Left(failure));
    },
    build: () => _createSut(pageService: pageService),
    act: (bloc) => bloc.add(const ClientSearchEvent.nextPageRequested()),
    skip: 1,
    expect: () => [
      ClientSearchState.initial().copyWith(
        isLoading: false,
      )
    ],
  );

  blocTest(
    """Emit [ClientSearchState] with:
    [isLoading] equal to true. 
    [term] equal to added value.
    call [PageService.getPage()] once 
    then emit [ClientSearchState] with:
    [isLoading] equal to false.
    [clients] equal to [PageService.getPage()] result,
    when [termChanged(value)] event is added""",
    setUp: () {
      pageService = MockClientPageService();
      clients = _createClients();
      when(pageService.getPage(
        limit: anyNamed("limit"),
        offset: anyNamed("offset"),
        filter: anyNamed("filter"),
      )).thenAnswer((_) async => Right(clients));
    },
    build: () => _createSut(pageService: pageService),
    act: (bloc) => bloc.add(const ClientSearchEvent.termChanged(term: term)),
    expect: () => [
      ClientSearchState.initial().copyWith(
        term: term,
        isLoading: true,
      ),
      ClientSearchState.initial().copyWith(
        term: term,
        isLoading: false,
        clients: clients,
      )
    ],
    verify: (bloc) => verify(pageService.getPage(
      limit: anyNamed("limit"),
      offset: anyNamed("offset"),
      filter: anyNamed("filter"),
    )).called(1),
  );
}

ClientSearchBloc _createSut({ClientPageService? pageService}) {
  return ClientSearchBloc(pageService ?? MockClientPageService());
}

Iterable<Client> _createClients() {
  return Iterable.generate(5).map((e) => Client(
        id: Uid.fromInt(e),
        name: Name("Bob"),
      ));
}
