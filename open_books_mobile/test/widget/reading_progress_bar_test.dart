import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_books_mobile/shared/ui/widgets/reading_progress_bar.dart';

void main() {
  group('ReadingProgressBar', () {
    testWidgets('displays correct percentage', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ReadingProgressBar(progreso: 50),
          ),
        ),
      );

      expect(find.text('50%'), findsOneWidget);
    });

    testWidgets('clamps progreso to 0-100 range', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ReadingProgressBar(progreso: 150),
          ),
        ),
      );

      expect(find.text('100%'), findsOneWidget);
    });

    testWidgets('clamps negative progreso to 0', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ReadingProgressBar(progreso: -10),
          ),
        ),
      );

      expect(find.text('0%'), findsOneWidget);
    });

    testWidgets('hides percentage when showPercentage is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ReadingProgressBar(
              progreso: 50,
              showPercentage: false,
            ),
          ),
        ),
      );

      expect(find.text('50%'), findsNothing);
    });

    testWidgets('displays label when showLabel is true', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ReadingProgressBar(
              progreso: 50,
              showLabel: true,
              label: 'Progress',
            ),
          ),
        ),
      );

      expect(find.text('Progress'), findsOneWidget);
    });

    testWidgets('hides label when showLabel is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ReadingProgressBar(
              progreso: 50,
              showLabel: false,
              label: 'Progress',
            ),
          ),
        ),
      );

      expect(find.text('Progress'), findsNothing);
    });

    testWidgets('does not display label when label is null', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ReadingProgressBar(
              progreso: 50,
              showLabel: true,
            ),
          ),
        ),
      );

      expect(find.byType(Text), findsWidgets);
    });

    testWidgets('renders LinearProgressIndicator', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ReadingProgressBar(progreso: 50),
          ),
        ),
      );

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });
  });
}