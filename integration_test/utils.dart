import 'package:flutter_test/flutter_test.dart';

Future<void> scrollUpAndDown(
  WidgetTester tester, {
  required Finder scrollableFinder,
  required Finder lastItemFinder,
  required Finder firstItemFinder,
  int numberOfUpAndDownScrolls = 20,
  int maxScrolls = 20,
  double scrollDelta = 1000000.0,
  Duration duration = const Duration(microseconds: 1),
}) async {
  for (var i = 1; i <= numberOfUpAndDownScrolls; i++) {
    if (i.isOdd) {
      await customScrollUntilVisible(
        tester,
        scrollable: scrollableFinder,
        finder: lastItemFinder,
        scrollDelta: scrollDelta,
        maxNumberOfScrolls: maxScrolls,
      );
    } else {
      await customScrollUntilVisible(
        tester,
        scrollable: scrollableFinder,
        finder: firstItemFinder,
        scrollDelta: -scrollDelta,
        maxNumberOfScrolls: maxScrolls,
      );
    }
  }
}

Future<void> customScrollUntilVisible(
  WidgetTester tester, {
  required Finder scrollable,
  required Finder finder,
  required double scrollDelta,
  int maxNumberOfScrolls = 50,
}) async {
  int maxScrolls = maxNumberOfScrolls;
  while (maxScrolls > 0 && finder.evaluate().isEmpty) {
    await tester.drag(scrollable, Offset(0, -scrollDelta));
    await tester.pump(const Duration(microseconds: 1));
    maxScrolls -= 1;
  }
  await tester.pumpAndSettle();
}
