import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:list_view_performance/main.dart';

import 'utils.dart';

/// flutter drive --driver=test_driver/perf_driver.dart --target=integration_test/list_view_test.dart -d Linux --profile
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Default List View Performance Test', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();
      await navigateToDefault(tester);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      await binding.traceAction(
        () async {
          final scrollableFinder = find.byType(Scrollable);
          final firstItemFinder = find.byKey(const ValueKey('0'));
          final lastItemFinder = find.byKey(const ValueKey('999999'));

          await scrollUpAndDown(
            tester,
            scrollableFinder: scrollableFinder,
            lastItemFinder: lastItemFinder,
            firstItemFinder: firstItemFinder,
          );
        },
        reportKey: 'default_list_view',
      );
    });
  });
}

Future<void> navigateToDefault(WidgetTester tester) async {
  final backFinder = find.byKey(
    const ValueKey('default_list_view'),
  );
  expect(backFinder, findsOneWidget);
  await tester.tap(backFinder);
  await tester.pumpAndSettle();
}
