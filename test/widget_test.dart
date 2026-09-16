import 'package:flutter_test/flutter_test.dart';
import 'package:oopdart/main.dart';

void main() {
  testWidgets('menu menampilkan semua item widget', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('1. Text Widget'), findsOneWidget);
    expect(find.text('2. Container Widget'), findsOneWidget);
    expect(find.text('3. Center Widget'), findsOneWidget);
    expect(find.text('4. Image Widget (Online Link)'), findsOneWidget);
    expect(find.text('5. Image Widget (in project)'), findsOneWidget);
    expect(find.text('6. Calculator Widget'), findsOneWidget);
    expect(find.text('7. Lorem Ipsum'), findsOneWidget);
    expect(find.text('8. Sizebox Widget'), findsOneWidget);
    expect(find.text('9. Icon Widget'), findsOneWidget);
  });
}
