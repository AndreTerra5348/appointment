import 'package:appointment/infrastructure/client/dao.dart';
import 'package:appointment/presentation/home/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../config/mock_di.dart' as mock_di;
import 'page_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ClientDao>(unsupportedMembers: {#table, #alias}),
])
void main() {
  final MockClientDao mockClientDao = MockClientDao();
  mock_di.mockServicesConfiguration(mockClientDao);
  setUp(() {
    when(mockClientDao.getPage(
      limit: anyNamed("limit"),
      offset: anyNamed("offset"),
      filter: anyNamed("filter"),
    )).thenAnswer((_) => Future.value(const Iterable.empty()));
  });

  testWidgets(
    "Render localized app title",
    (tester) async {
      await tester.pumpWidget(const MockApp());
      expect(find.text(AppLocalizationsEn().appointmentTitle), findsOneWidget);
    },
  );

  testWidgets(
    "Render localized app subtitle",
    (tester) async {
      await tester.pumpWidget(const MockApp());
      expect(
          find.text(AppLocalizationsEn().appointmentSubtitle), findsOneWidget);
    },
  );

  testWidgets(
    "Render ElevatedButton with pageClientRegisterTitle localized text",
    (tester) async {
      await tester.pumpWidget(const MockApp());
      expect(
          find.widgetWithText(
              ElevatedButton, AppLocalizationsEn().pageClientRegisterTitle),
          findsOneWidget);
    },
  );

  testWidgets(
    "Render ElevatedButton with pageClientSearchTitle localized text",
    (tester) async {
      await tester.pumpWidget(const MockApp());
      expect(
          find.widgetWithText(
              ElevatedButton, AppLocalizationsEn().pageClientSearchTitle),
          findsOneWidget);
    },
  );
}

class MockApp extends StatelessWidget {
  const MockApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      locale: Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: HomePage(),
    );
  }
}
