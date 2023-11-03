import 'package:flutter_test/flutter_test.dart';

import 'package:calculadora/main.dart';

void main() {
  testWidgets('Testar a inicialização do APP', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Main());

    await tester.pumpAndSettle();

    expect(find.text('Calculadora'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('5'), findsOneWidget);
    expect(find.text('6'), findsOneWidget);
    expect(find.text('7'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);
    expect(find.text('9'), findsOneWidget);
    expect(find.text('0'), findsWidgets);
    expect(find.text('.'), findsOneWidget);
    expect(find.text('÷'), findsOneWidget);
    expect(find.text('x'), findsOneWidget);
    expect(find.text('+'), findsOneWidget);
    expect(find.text('-'), findsOneWidget);
    expect(find.text('='), findsOneWidget);
    expect(find.text('AC'), findsOneWidget);
    expect(find.text('DEL'), findsOneWidget);
  });
}
