// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_analyzer/lib.dart';

Future<void> _createWidget(final WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp.router(
    title: 'Weather Analyzer',
    theme: ThemeData(
      brightness: Brightness.light,
    ),
    routerConfig: Modular.routerConfig,
  ));

  await tester.pump();
}

//TODO: implement at least one widget test.
void main() {
  testWidgets('Counter increments smoke test',
      (final WidgetTester tester) async {
    await tester.pumpWidget(ModularApp(
      module: BaseModule(),
      child: const AppWidget(),
    ));
    //await _createWidget(tester);
    // Build our app and trigger a frame.
    //await tester.pumpWidget(const SplashPage());

    // Verify that our counter starts at 0.
    expect(find.text('Weather Analyzer'), findsOneWidget);
    expect(find.text('Torres'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    //await tester.tap(find.byIcon(Icons.add));
    //await tester.pump();

    // Verify that our counter has incremented.
    //expect(find.text('São Paulo'), findsOneWidget);
    //expect(find.text('Torres'), findsNothing);
  });
}
