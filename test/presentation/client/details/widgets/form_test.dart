import 'package:appointment/application/client/bloc/bloc.dart';
import 'package:appointment/application/details/bloc/bloc.dart';
import 'package:appointment/application/delete/bloc/bloc.dart';
import 'package:appointment/application/load/bloc/bloc.dart';
import 'package:appointment/application/edit/bloc/bloc.dart';
import 'package:appointment/domain/client/entity.dart';
import 'package:appointment/domain/client/values.dart';
import 'package:appointment/domain/common/values.dart';
import 'package:appointment/domain/core/repository.dart';
import 'package:appointment/infrastructure/client/dao.dart';
import 'package:appointment/presentation/app_ointment.dart';
import 'package:appointment/presentation/client/common/widgets/name_form_field.dart';
import 'package:appointment/presentation/client/details/widgets/name_input.dart';
import 'package:appointment/presentation/client/details/page.dart';
import 'package:appointment/presentation/client/details/widgets/form.dart';
import 'package:appointment/presentation/client/search/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'form_test.mocks.dart';
import 'page_mock.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';

import '../../../../common/failure_fixture.dart' as mock_failure;
import '../../../../common/client_fixture.dart' as client_fixture;
import '../../../config/mock_di.dart' as mock_di;

@GenerateMocks([
  LoadBloc,
  EditBloc,
  DeleteBloc,
  ClientBloc,
  DetailsBloc,
])
@GenerateNiceMocks([
  MockSpec<ClientDao>(unsupportedMembers: {#table, #alias}),
])
void main() {
  late Client johnClient;
  late Client renamedJohnClient;
  late MockLoadBloc<Client> mockLoadBloc;
  late MockEditBloc<Client> mockEditBloc;
  late MockDeleteBloc<Client> mockDeleteBloc;
  late MockDetailsBloc<Client> mockDetailsBloc;
  late MockClientBloc mockClientBloc;

  late MockClientDetailPage mockClientDetailPage;

  setUp(() {
    johnClient = Client(name: Name("John"), id: Uid.fromInt(1));
    renamedJohnClient = johnClient.copyWith(name: Name("Gohn"));
    mockLoadBloc = MockLoadBloc<Client>();
    mockEditBloc = MockEditBloc<Client>();
    mockDeleteBloc = MockDeleteBloc<Client>();
    mockDetailsBloc = MockDetailsBloc<Client>();
    mockClientBloc = MockClientBloc();

    mockClientDetailPage = MockClientDetailPage(
      client: johnClient,
      clientLoadBloc: mockLoadBloc,
      clientDeleteBloc: mockDeleteBloc,
      clientEditBloc: mockEditBloc,
      clientBloc: mockClientBloc,
      detailsBloc: mockDetailsBloc,
      child: const ClientDetailsFormWidget(),
    );

    when(mockLoadBloc.state).thenReturn(LoadState.loading());
    when(mockEditBloc.state).thenReturn(const EditState.initial());
    when(mockDeleteBloc.state).thenReturn(const DeleteState.initial());
    when(mockClientBloc.state).thenReturn(ClientState.initial());
    when(mockDetailsBloc.state)
        .thenReturn(const DetailsState<Client>.initial());

    when(mockLoadBloc.stream).thenAnswer((_) => const Stream.empty());
    when(mockEditBloc.stream).thenAnswer((_) => const Stream.empty());
    when(mockDeleteBloc.stream).thenAnswer((_) => const Stream.empty());
    when(mockClientBloc.stream).thenAnswer((_) => const Stream.empty());
    when(mockDetailsBloc.stream).thenAnswer((_) => const Stream.empty());
  });

  group("Given [LoadState] is [loading()]", () {
    setUp(() {
      final state = DetailsState<Client>.load(state: LoadState.loading());
      when(mockDetailsBloc.state).thenReturn(state);
    });
    testWidgets("Render loading indicator", (tester) async {
      await tester.pumpWidget(mockClientDetailPage);

      expectLater(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets("Render NameInputWidget", (tester) async {
      await tester.pumpWidget(mockClientDetailPage);

      expectLater(find.byType(DetailsNameInputWidget), findsOneWidget);
    });
  });

  group("When [LoadState] is [success(client)] ", () {
    setUp(() {
      final state = LoadState.success(entity: johnClient);
      when(mockClientBloc.state).thenReturn(ClientState(client: johnClient));

      when(mockDetailsBloc.stream).thenAnswer(
          (_) => Stream.value(DetailsState<Client>.load(state: state)));
    });

    testWidgets(
      "Render NameInputWidget with client name",
      (tester) async {
        await tester.pumpWidget(mockClientDetailPage);

        expect(
          find.widgetWithText(
              DetailsNameInputWidget, johnClient.name.getOrThrow()),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      "Add [ClientEvent.loaded(client)] with loaded client once",
      (tester) async {
        await tester.pumpWidget(mockClientDetailPage);

        await tester.pump();

        verify(
          mockClientBloc.add(ClientEvent.loaded(client: johnClient)),
        ).called(1);
      },
    );

    group("When [EditState] is [editing()]", () {
      setUp(() {
        when(mockEditBloc.state).thenReturn(const EditState.editing());
      });

      testWidgets(
        "All NameFormFields should be enabled ",
        (tester) async {
          await tester.pumpWidget(mockClientDetailPage);

          expect(find.byType(NameFormField), findsNWidgets(1));
          expect(
            find.byWidgetPredicate(
              (widget) => widget is NameFormField && widget.enabled,
            ),
            findsNWidgets(1),
          );
        },
      );

      group("When [EditState] is [inProgress()] ", () {
        setUp(() {
          when(mockDetailsBloc.state).thenReturn(
            const DetailsState<Client>.edit(state: EditState.inProgress()),
          );
        });
        testWidgets(
          "Show loading indicator",
          (tester) async {
            await tester.pumpWidget(mockClientDetailPage);

            expect(find.byType(CircularProgressIndicator), findsOneWidget);
          },
        );
      });
      group("When [EditState] is [success()] ", () {
        setUp(() {
          when(mockDetailsBloc.stream).thenAnswer(
            (_) => Stream.value(
              const DetailsState<Client>.edit(
                state: EditState.success(),
              ),
            ),
          );
        });
        testWidgets(
          "Add [DetailsEvent.loaded(clientBloc.client.id)] once",
          (tester) async {
            when(mockClientBloc.state).thenReturn(
              ClientState(client: renamedJohnClient),
            );
            await tester.pumpWidget(mockClientDetailPage);

            verify(mockLoadBloc.add(
              LoadEvent.loaded(id: renamedJohnClient.id),
            )).called(1);
          },
        );

        testWidgets(
          "Hide loading indicator ",
          (tester) async {
            await tester.pumpWidget(mockClientDetailPage);

            expect(find.byType(CircularProgressIndicator), findsNothing);
          },
        );

        testWidgets(
          "Show Icons.check_circle_outline for 1 second",
          (tester) async {
            await tester.pumpWidget(mockClientDetailPage);
            await tester.pump();

            expect(find.byIcon(Icons.check_circle_outline), findsOneWidget);

            await tester.pump(const Duration(seconds: 1));

            expect(find.byIcon(Icons.check_circle_outline), findsNothing);
          },
        );
      });

      group("When [EditState] is [failure()] ", () {
        testWidgets(
          "Show Icons.error_outline for 1 second",
          (tester) async {
            final state = EditState.repositoryFailure(
              failure: mock_failure.dbErrorRepositoryFailure,
            );

            when(mockDetailsBloc.stream).thenAnswer(
              (_) => Stream.value(
                DetailsState<Client>.edit(state: state),
              ),
            );
            await tester.pumpWidget(mockClientDetailPage);
            await tester.pump();

            expect(find.byIcon(Icons.error_outline), findsOneWidget);

            await tester.pump(const Duration(seconds: 1));

            expect(find.byIcon(Icons.error_outline), findsNothing);
          },
        );

        testWidgets(
          "Show localized dbErrorRepositoryFailure failure message "
          "for 1 second",
          (tester) async {
            final state = EditState.repositoryFailure(
              failure: mock_failure.dbErrorRepositoryFailure,
            );

            when(mockDetailsBloc.stream).thenAnswer(
              (_) => Stream.value(
                DetailsState<Client>.edit(state: state),
              ),
            );
            await tester.pumpWidget(mockClientDetailPage);
            await tester.pump();

            expect(
              find.text(mock_failure.dbErrorLocalizedMessage),
              findsOneWidget,
            );

            await tester.pump(const Duration(seconds: 1));

            expect(
              find.text(mock_failure.dbErrorLocalizedMessage),
              findsNothing,
            );
          },
        );

        testWidgets(
          "Show localized SubmissionFailure.notFound() failure message "
          "for 1 second",
          (tester) async {
            final state = EditState.notFoundFailure();

            when(mockDetailsBloc.stream).thenAnswer(
              (_) => Stream.value(
                DetailsState<Client>.edit(state: state),
              ),
            );
            await tester.pumpWidget(mockClientDetailPage);
            await tester.pump();

            expect(
              find.text(mock_failure.notFoundLocalizedMessage),
              findsOneWidget,
            );

            await tester.pump(const Duration(seconds: 1));

            expect(
              find.text(mock_failure.notFoundLocalizedMessage),
              findsNothing,
            );
          },
        );
      });
    });

    group("When [deleteState] is [inProgress()]", () {
      setUp(() {
        when(mockDetailsBloc.state).thenReturn(
          const DetailsState<Client>.delete(
            state: DeleteState.inProgress(),
          ),
        );
      });

      testWidgets(
        "Show loading indicator",
        (tester) async {
          await tester.pumpWidget(mockClientDetailPage);

          expect(find.byType(CircularProgressIndicator), findsOneWidget);
        },
      );
    });

    group("When [deleteState] is [failure()]", () {
      testWidgets(
        "Show Icons.error_outline for 1 second",
        (tester) async {
          final state = DeleteState.repositoryFailure(
            failure: mock_failure.dbErrorRepositoryFailure,
          );

          when(mockDetailsBloc.stream).thenAnswer(
            (_) => Stream.value(
              DetailsState<Client>.delete(state: state),
            ),
          );
          await tester.pumpWidget(mockClientDetailPage);
          await tester.pump();

          expect(find.byIcon(Icons.error_outline), findsOneWidget);

          await tester.pump(const Duration(seconds: 1));

          expect(find.byIcon(Icons.error_outline), findsNothing);
        },
      );

      testWidgets(
        "Show localized dbErrorRepositoryFailure failure message "
        "for 1 second",
        (tester) async {
          final state = DeleteState.repositoryFailure(
            failure: mock_failure.dbErrorRepositoryFailure,
          );

          when(mockDetailsBloc.stream).thenAnswer(
            (_) => Stream.value(
              DetailsState<Client>.delete(state: state),
            ),
          );
          await tester.pumpWidget(mockClientDetailPage);
          await tester.pump();

          expect(
            find.text(mock_failure.dbErrorLocalizedMessage),
            findsOneWidget,
          );

          await tester.pump(const Duration(seconds: 1));

          expect(
            find.text(mock_failure.dbErrorLocalizedMessage),
            findsNothing,
          );
        },
      );

      testWidgets(
        "Show localized SubmissionFailure.notFound() failure message "
        "for 1 second",
        (tester) async {
          final state = DeleteState.notFoundFailure();

          when(mockDetailsBloc.stream).thenAnswer(
            (_) => Stream.value(
              DetailsState<Client>.delete(state: state),
            ),
          );
          await tester.pumpWidget(mockClientDetailPage);
          await tester.pump();

          expect(
            find.text(mock_failure.notFoundLocalizedMessage),
            findsOneWidget,
          );

          await tester.pump(const Duration(seconds: 1));

          expect(
            find.text(mock_failure.notFoundLocalizedMessage),
            findsNothing,
          );
        },
      );
    });
  });

  group("Mocked DI container", () {
    final mockClientDao = MockClientDao();
    mock_di.mockServicesConfiguration(mockClientDao);
    testWidgets(
      "When [LoadState] is [failure] "
      "Show localized failure message "
      "for 1 second"
      "and go back to previous page",
      (tester) async {
        final models = client_fixture.generateModel(amount: 5);
        final ex = StateError(mock_failure.errorMessage);

        when(mockClientDao.getPage(
          limit: anyNamed("limit"),
          offset: anyNamed("offset"),
          filter: anyNamed("filter"),
        )).thenAnswer((_) => Future.value(models));

        when(mockClientDao.getById(any)).thenThrow(ex);

        await tester.pumpWidget(AppOintment());
        await tester.pumpAndSettle();

        await tester.tap(
          find.widgetWithText(
            ElevatedButton,
            AppLocalizationsEn().pageClientSearchTitle,
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(
          find.text(models.first.id.getOrThrow().toString()),
        );
        await tester.pumpAndSettle();

        expect(find.byType(ClientDetailsPage), findsOneWidget);

        final localizedErrorMessage = AppLocalizationsEn().databaseFailure(
          ex.toString(),
        );

        expect(
          find.text(localizedErrorMessage),
          findsOneWidget,
        );

        await tester.pump(const Duration(seconds: 1));
        await tester.pumpAndSettle();

        expect(
          find.text(localizedErrorMessage),
          findsNothing,
        );
        expect(find.byType(ClientDetailsPage), findsNothing);
      },
    );

    testWidgets(
      "When delete successful dialog is dismissed, pop page",
      (tester) async {
        final models = client_fixture.generateModel(amount: 5);

        when(mockClientDao.getPage(
          limit: anyNamed("limit"),
          offset: anyNamed("offset"),
          filter: anyNamed("filter"),
        )).thenAnswer((_) => Future.value(models));

        when(mockClientDao.getById(any)).thenAnswer(
          (_) => Future.value(models.first),
        );

        when(mockClientDao.remove(any)).thenAnswer(
          (_) => Future.value(true),
        );
        await tester.pumpWidget(AppOintment());
        await tester.pumpAndSettle();

        await tester.tap(
          find.widgetWithText(
            ElevatedButton,
            AppLocalizationsEn().pageClientSearchTitle,
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text(models.first.id.getOrThrow().toString()));
        await tester.pumpAndSettle();

        expect(find.byType(ClientDetailsPage), findsOneWidget);

        await tester.tap(find.byIcon(Icons.delete_outlined));
        await tester.pump();

        await tester.tap(find.text(AppLocalizationsEn().delete));
        await tester.pump(const Duration(seconds: 1));
        await tester.pumpAndSettle();

        expect(find.byType(ClientSearchPage), findsOneWidget);
      },
    );
  });
}
