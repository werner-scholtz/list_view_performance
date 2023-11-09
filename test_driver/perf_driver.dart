// ignore: depend_on_referenced_packages
import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:integration_test/integration_test_driver.dart';

import 'save_summaries_as_csv.dart';
import 'save_timeline.dart';

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

Future<void> savePerformanceSummary({
  required String timelineDirectory,
  required String summaryDirectory,
  required String fileName,
  required String reportKey,
  required Map<String, dynamic> data,
}) async {
  // Exact the timeline data and save it.
  driver.TimelineSummary summary = await saveTimeLine(
    timeline: driver.Timeline.fromJson(data[reportKey]),
    timelineDirectory: timelineDirectory,
    fileName: fileName,
  );

  Map<String, Map<String, dynamic>> summaries = {};

  // Add the summary to the summaries map.
  summaries[fileName] = summary.summaryJson;

  // Save the summaries as a CSV file.
  await saveSummariesAsCSV(
    summaries: summaries,
    destinationDirectory: summaryDirectory,
    type: '',
    fileName: fileName,
  );
}
