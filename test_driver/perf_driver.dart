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
        // Check if the data contains the default list view report.
        if (data.containsKey(listViewReportKey)) {
          final performanceData =
              data[listViewReportKey] as Map<String, dynamic>;

          await savePerformanceData(
            performanceData: performanceData,
            reportKey: listViewReportKey,
            directory: listViewDirectory,
          );
        }

        // Check if the data contains the custom list view report.
        if (data.containsKey(customListViewReportKey)) {
          final performanceData =
              data[customListViewReportKey] as Map<String, dynamic>;

          await savePerformanceData(
            performanceData: performanceData,
            reportKey: listViewReportKey,
            directory: listViewDirectory,
          );
        }
      }
    },
  );
}
