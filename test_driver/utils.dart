// ignore: depend_on_referenced_packages
import 'package:flutter_driver/flutter_driver.dart';
import 'package:integration_test/integration_test_driver.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'dart:io';

Future<void> savePerformanceData({
  required Map<String, dynamic> performanceData,
  required String reportKey,
  required String directory,
}) async {
  // Save the performance summary.
  final jsonDir = '$directory/json';
  final numberOfFilesInJsonDir = getNumberOfFilesInDirectory(jsonDir);
  final jsonFileName = '${reportKey}_${numberOfFilesInJsonDir + 1}';
  await writeResponseData(
    performanceData,
    testOutputFilename: jsonFileName,
    destinationDirectory: jsonDir,
  );

  // Save the summary as a CSV file.
  final csvDir = '$directory/csv';
  final csvFileName = '$reportKey.csv';
  fs.directory(csvDir).createSync(recursive: true);
  final csvFile = fs.file(path.join(csvDir, csvFileName));

  List<String> dataKeys = performanceData.keys.toList();

  // Create the file if it does not exist and write the header.
  if (!csvFile.existsSync()) {
    csvFile.createSync();

    // Construct the header
    String header = reportKey;
    for (var key in dataKeys) {
      header = '$header, $key';
    }

    // Append the data to the file.
    csvFile.writeAsStringSync(header, mode: FileMode.append);
  }

  String output = '\n';
  for (var key in dataKeys) {
    final data = performanceData[key];
    output = '$output, "$data"';
  }

  // Append the data to the file.
  csvFile.writeAsStringSync(output, mode: FileMode.append);
}

/// Get the number of files in the [directoryPath].
int getNumberOfFilesInDirectory(String directoryPath) {
  final directory = Directory(directoryPath);

  // If the directory does not exist, return 0.
  if (!directory.existsSync()) return 0;

  // If the directory exists, count the number of files.
  int numberOfFiles = 0;
  directory.listSync().forEach((element) {
    if (element is File) {
      numberOfFiles++;
    }
  });

  return numberOfFiles;
}
