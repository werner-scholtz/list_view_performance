// ignore: depend_on_referenced_packages
import 'package:integration_test/integration_test_driver.dart';

import 'utils.dart';

const String performanceDirectory = 'performance_summary';
const String listViewDirectory = '$performanceDirectory/list_view';
const String customListViewDirectory = '$performanceDirectory/custom_list_view';

const String listViewReportKey = 'default_list_view';
const String customListViewReportKey = 'custom_list_view';

Future<void> main() async {
  return integrationDriver(
    responseDataCallback: (data) async {
      if (data != null) {
        if (data.containsKey(listViewReportKey)) {
          await savePerformanceSummary(
            timelineDirectory: '$listViewDirectory/timelines/',
            summaryDirectory: '$listViewDirectory/summary/',
            fileName: 'list_view',
            reportKey: listViewReportKey,
            data: data,
          );
        }

        if (data.containsKey(customListViewReportKey)) {
          await savePerformanceSummary(
            timelineDirectory: '$customListViewDirectory/timelines/',
            summaryDirectory: '$customListViewDirectory/summary/',
            fileName: 'custom_list_view',
            reportKey: customListViewReportKey,
            data: data,
          );
        }
      }
    },
  );
}
