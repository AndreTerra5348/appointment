import 'package:appointment/application/client/bloc/client_bloc.dart';
import 'package:appointment/application/details/bloc/details_bloc.dart';
import 'package:appointment/application/delete/bloc/delete_bloc.dart';
import 'package:appointment/application/load/bloc/load_bloc.dart';
import 'package:appointment/application/edit/bloc/edit_bloc.dart';
import 'package:appointment/domain/client/client_entity.dart';
import 'package:appointment/domain/client/client_values.dart';
import 'package:appointment/domain/common/common_values.dart';
import 'package:appointment/presentation/client/details/client_details_page.dart';
import 'package:appointment/presentation/client/details/widgets/client_details_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'client_details_page_test.mocks.dart';

@GenerateMocks([
  LoadBloc,
  DeleteBloc,
  EditBloc,
  ClientBloc,
  DetailsBloc,
])
void main() {
  late MaterialApp app;
  late Client johnClient;
  late MockLoadBloc<Client> mockLoadBloc;
  late MockEditBloc<Client> mockEditBloc;
  late MockDeleteBloc<Client> mockDeleteBloc;
  late MockDetailsBloc<Client> mockDetailsBloc;
  late MockClientBloc mockClientBloc;
  setUp(() {
    johnClient = Client(name: Name("John"), id: Identifier.fromInt(1));
    mockLoadBloc = MockLoadBloc<Client>();
    mockEditBloc = MockEditBloc<Client>();
    mockDeleteBloc = MockDeleteBloc<Client>();
    mockDetailsBloc = MockDetailsBloc<Client>();
    mockClientBloc = MockClientBloc();

    app = MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: ClientDetailsPage(
        clientBloc: mockClientBloc,
        loadBloc: mockLoadBloc,
        editBloc: mockEditBloc,
        detailsBloc: mockDetailsBloc,
        deleteBloc: mockDeleteBloc,
        clientId: johnClient.id,
      ),
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

  testWidgets(
    "Render ClientDetailsPageScaffold",
    (tester) async {
      await tester.pumpWidget(app);
      expect(find.byType(ClientDetailsPageScaffold), findsOneWidget);
    },
  );

  testWidgets(
    "Add [LoadEvent.loaded(id)] once",
    (tester) async {
      await tester.pumpWidget(app);

      verify(
        mockLoadBloc.add(
          LoadEvent.loaded(id: johnClient.id),
        ),
      ).called(1);
    },
  );
}
