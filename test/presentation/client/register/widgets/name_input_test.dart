import 'package:appointment/application/client/register/bloc/bloc.dart';
import 'package:appointment/presentation/client/register/widgets/name_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'name_input_test.mocks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@GenerateMocks([ClientRegisterBloc])
void main() {
  group("Name input widget", () {
    testWidgets(
        "Should add nameChanged event to bloc when TextFormField value change",
        (WidgetTester tester) async {
      // Arrange
      const name = "Bob";
      final mockBloc = MockClientRegisterBloc();
      when(mockBloc.state).thenReturn(ClientRegisterState.initial());
      when(mockBloc.stream).thenAnswer((_) => const Stream.empty());

      await tester.pumpWidget(MockClientRegisterPage(bloc: mockBloc));
      await tester.pumpAndSettle();

      expect(find.byType(TextFormField), findsOneWidget);

      // Act
      await tester.enterText(find.byType(TextFormField), name);

      // Assert
      verify(mockBloc.add(any)).called(1);
    });
  });
}

class MockClientRegisterPage extends StatelessWidget {
  final ClientRegisterBloc bloc;
  const MockClientRegisterPage({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: BlocProvider(
          create: (context) => bloc,
          child: const MockClientRegisterFormWidget(),
        ),
      ),
    );
  }
}

class MockClientRegisterFormWidget extends StatelessWidget {
  const MockClientRegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const NameInputWidget();
  }
}
