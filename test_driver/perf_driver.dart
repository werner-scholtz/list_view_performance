// ignore: depend_on_referenced_packages
import 'package:integration_test/integration_test_driver.dart';
import 'utils.dart';

const String performanceDirectory = 'performance_summary';
const String listViewDirectory = '$performanceDirectory/data_tile';
const String customListViewDirectory = '$performanceDirectory/custom_data_tile';

const String dataTileReportKey = 'data_tile';
const String customDataTileReportKey = 'custom_data_tile';

Future<void> main() async {
  return integrationDriver(
    responseDataCallback: (data) async {
      if (data != null) {
        // Check if the data contains the default list view report.
        if (data.containsKey(dataTileReportKey)) {
          final performanceData =
              data[dataTileReportKey] as Map<String, dynamic>;

          await savePerformanceData(
            performanceData: performanceData,
            reportKey: dataTileReportKey,
            directory: listViewDirectory,
          );
        }

        // Check if the data contains the custom list view report.
        if (data.containsKey(customDataTileReportKey)) {
          final performanceData =
              data[customDataTileReportKey] as Map<String, dynamic>;

          await savePerformanceData(
            performanceData: performanceData,
            reportKey: customDataTileReportKey,
            directory: customListViewDirectory,
          );
        }
      }
    },
  );
}
