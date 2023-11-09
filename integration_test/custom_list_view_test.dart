import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:list_view_performance/main.dart';

import 'utils.dart';

/// flutter drive --driver=test_driver/perf_driver.dart --target=integration_test/custom_list_view_test.dart -d Linux --profile
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Custom Render Object List View Performance Test',
        (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      await navigateToCustom(tester);
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
        reportKey: 'custom_list_view',
      );
    });
  });
}

Future<void> navigateToCustom(WidgetTester tester) async {
  final backFinder = find.byKey(
    const ValueKey('custom_list_view'),
  );
  expect(backFinder, findsOneWidget);
  await tester.tap(backFinder);
  await tester.pumpAndSettle();
}
