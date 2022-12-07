import 'package:appointment/application/client/bloc/bloc.dart';
import 'package:appointment/application/delete/bloc/bloc.dart';
import 'package:appointment/application/details/bloc/bloc.dart';
import 'package:appointment/application/edit/bloc/bloc.dart';
import 'package:appointment/domain/client/entity.dart';
import 'package:appointment/domain/client/values.dart';
import 'package:appointment/domain/common/values.dart';
import 'package:appointment/infrastructure/client/dao.dart';
import 'package:appointment/infrastructure/drift/db.dart';
import 'package:appointment/presentation/app_ointment.dart';
import 'package:appointment/presentation/client/common/widgets/name_input.dart';
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
import '../../../config/mock_di.dart' as mock_di;

@GenerateMocks([DetailsBloc, EditBloc, DeleteBloc, ClientBloc])
@GenerateNiceMocks([
  MockSpec<ClientDao>(unsupportedMembers: {#table, #alias}),
])
void main() {
  late Client johnClient;
  late Client renamedJohnClient;
  late MockDetailsBloc<Client> mockDetailsBloc;
  late MockEditBloc<Client> mockEditBloc;
  late MockDeleteBloc<Client> mockDeleteBloc;
  late MockClientBloc mockClientBloc;

  late MockClientDetailPage mockClientDetailPage;

  setUp(() {
    johnClient = Client(name: Name("John"), id: Uid.fromInt(1));
    renamedJohnClient = johnClient.copyWith(name: Name("Gohn"));
    mockDetailsBloc = MockDetailsBloc<Client>();
    mockEditBloc = MockEditBloc<Client>();
    mockDeleteBloc = MockDeleteBloc<Client>();
    mockClientBloc = MockClientBloc();

    mockClientDetailPage = MockClientDetailPage(
      client: johnClient,
      clientDetailsBloc: mockDetailsBloc,
      clientDetailsDeleteBloc: mockDeleteBloc,
      clientDetailsEditBloc: mockEditBloc,
      clientBloc: mockClientBloc,
      child: const ClientDetailsFormWidget(),
    );

    when(mockDetailsBloc.state).thenReturn(DetailsState.loading());
    when(mockEditBloc.state).thenReturn(const EditState.initial());
    when(mockDeleteBloc.state).thenReturn(const DeleteState.initial());
    when(mockClientBloc.state).thenReturn(ClientState.initial());

    when(mockDetailsBloc.stream).thenAnswer((_) => const Stream.empty());
    when(mockEditBloc.stream).thenAnswer((_) => const Stream.empty());
    when(mockDeleteBloc.stream).thenAnswer((_) => const Stream.empty());
    when(mockClientBloc.stream).thenAnswer((_) => const Stream.empty());
  });

  group("Given [DetailsState] is [loading()]", () {
    testWidgets("Render loading indicator", (tester) async {
      await tester.pumpWidget(mockClientDetailPage);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets("Render NameInputWidget", (tester) async {
      await tester.pumpWidget(mockClientDetailPage);

      expect(find.byType(NameInputWidget), findsOneWidget);
    });
  });

  group("When [DetailsState] is [success(client)] ", () {
    setUp(() {
      final state = DetailsState.success(entity: johnClient);
      when(mockDetailsBloc.state).thenReturn(state);
      when(mockDetailsBloc.stream).thenAnswer((_) => Stream.value(state));

      when(mockClientBloc.state).thenReturn(ClientState(client: johnClient));
    });

    testWidgets(
      "Render NameInputWidget with client name",
      (tester) async {
        await tester.pumpWidget(mockClientDetailPage);

        expect(
          find.widgetWithText(NameInputWidget, johnClient.name.getOrThrow()),
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
        "All TextFormFields should be enabled ",
        (tester) async {
          await tester.pumpWidget(mockClientDetailPage);

          expect(find.byType(TextFormField), findsNWidgets(1));
          expect(
            find.byWidgetPredicate(
              (widget) => widget is TextFormField && widget.enabled,
            ),
            findsNWidgets(1),
          );
        },
      );

      group("When [EditState] is [inProgress()] ", () {
        testWidgets(
          "Show loading indicator",
          (tester) async {
            when(mockEditBloc.state).thenReturn(
              const EditState.inProgress(),
            );
            await tester.pumpWidget(mockClientDetailPage);

            expect(find.byType(CircularProgressIndicator), findsOneWidget);
          },
        );
      });
      group("When [EditState] is [success()] ", () {
        setUp(() {
          const state = EditState.success();
          when(mockEditBloc.state).thenReturn(state);
          when(mockEditBloc.stream).thenAnswer((_) => Stream.value(state));
        });
        testWidgets(
          "Add [DetailsEvent.loaded(clientBloc.client.id)] once",
          (tester) async {
            when(mockClientBloc.state).thenReturn(
              ClientState(client: renamedJohnClient),
            );
            await tester.pumpWidget(mockClientDetailPage);

            verify(mockDetailsBloc.add(
              DetailsEvent.loaded(id: renamedJohnClient.id),
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
        setUp(() {
          final state = EditState.repositoryFailure(
            failure: mock_failure.dbErrorRepositoryFailure,
          );
          when(mockEditBloc.state).thenReturn(state);
          when(mockEditBloc.stream).thenAnswer(
            (_) => Stream.value(state),
          );
        });

        testWidgets(
          "Show Icons.error_outline for 1 second",
          (tester) async {
            await tester.pumpWidget(mockClientDetailPage);
            await tester.pump();

            expect(find.byIcon(Icons.error_outline), findsOneWidget);

            await tester.pump(const Duration(seconds: 1));

            expect(find.byIcon(Icons.error_outline), findsNothing);
          },
        );

        testWidgets(
          "Show failure message for 1 second",
          (tester) async {
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
      });
    });
  });

  testWidgets(
    "When delete successful dialog is dismissed, pop page",
    (tester) async {
      final mockClientDao = MockClientDao();

      final models = Iterable.generate(5).map(
        (e) => ClientModel(id: e + 1, name: "Bob"),
      );

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

      mock_di.mockServicesConfiguration(mockClientDao);

      await tester.pumpWidget(AppOintment());
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppLocalizationsEn().homeDrawerClientSearch));
      await tester.pumpAndSettle();

      await tester.tap(find.text(models.first.id.toString()));
      await tester.pumpAndSettle();

      expect(find.byType(ClientDetailsPage), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete));
      await tester.pump();

      await tester.tap(find.text(AppLocalizationsEn().delete));
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      expect(find.byType(ClientSearchPage), findsOneWidget);
    },
  );
}
