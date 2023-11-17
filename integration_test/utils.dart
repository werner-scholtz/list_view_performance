import 'package:flutter_test/flutter_test.dart';

Future<void> scrollUpAndDown({
  required WidgetTester tester,
  required Finder firstItemFinder,
  required Finder lastItemFinder,
  required Finder scrollable,
  required double delta,
}) async {
  // scroll down.
  await tester.scrollUntilVisible(
    lastItemFinder,
    delta,
    scrollable: scrollable,
  );

  // // scroll up.
  await tester.scrollUntilVisible(
    firstItemFinder,
    -delta,
    scrollable: scrollable,
  );
}
