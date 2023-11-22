import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:list_view_performance/main.dart';

import '../test_driver/perf_driver.dart';
import 'constants.dart';
import 'utils.dart';

/// flutter drive --driver=test_driver/perf_driver.dart --target=integration_test/data_tile_test.dart -d Linux --profile
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  testWidgets('Performance Test for DataTile', (tester) async {
    await tester.pumpWidget(MyApp(items: items));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('data_tile_list_view')));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(milliseconds: 250));

    final firstItemFinder = find.byKey(firstItemKey);
    final lastItemFinder = find.byKey(lastItemKey);
    final scrollable = find.byType(Scrollable);

    await binding.watchPerformance(
      () async {
        await scrollUpAndDown(
          tester: tester,
          firstItemFinder: firstItemFinder,
          lastItemFinder: lastItemFinder,
          scrollable: scrollable,
          delta: delta,
        );
      },
      reportKey: dataTileReportKey,
    );
  });
}
