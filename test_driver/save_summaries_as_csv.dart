import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:flutter_driver/flutter_driver.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

import 'get_number_of_files_in_directory.dart';

///
Future<void> saveSummariesAsCSV({
  required Map<String, Map<String, dynamic>> summaries,
  required String destinationDirectory,
  required String type,
  String fileName = '',
}) async {
  await fs.directory(destinationDirectory).create(recursive: true);

  // Get the number of files in the destinationDirectory.
  int numberOfFiles = getNumberOfFilesInDirectory(destinationDirectory);

  if (numberOfFiles >= 1) {
    File file = fs.file(
      path.join(
          destinationDirectory, '${fileName}_performance_summary$type.csv'),
    );

    List<String> dataKeys = summaries[summaries.keys.first]!.keys.toList();
    String output = '\n';
    for (var dataKey in dataKeys) {
      for (var summaryKey in summaries.keys) {
        if (shouldRemoveWhiteSpace(dataKey)) {
          output =
              '$output, "${summaries[summaryKey]![dataKey]!.toString().replaceAll(RegExp(r"\s+"), "")}"';
        } else {
          output = '$output, "${summaries[summaryKey]![dataKey]!}"';
        }
      }
    }
    // Append the data to the file.
    await file.writeAsString(output, mode: FileMode.append);
  } else {
    // Create the file.
    final File file = fs.file(
      path.join(
          destinationDirectory, '${fileName}_performance_summary$type.csv'),
    );

    String header = fileName;
    List<String> dataKeys = summaries[summaries.keys.first]!.keys.toList();
    for (var key in dataKeys) {
      header = '$header, $key';
    }

    file.writeAsStringSync(header, mode: FileMode.append);

    String output = '\n';
    for (var dataKey in dataKeys) {
      for (var summaryKey in summaries.keys) {
        if (shouldRemoveWhiteSpace(dataKey)) {
          output =
              '$output, "${summaries[summaryKey]![dataKey]!.toString().replaceAll(RegExp(r"\s+"), "")}"';
        } else {
          output = '$output, "${summaries[summaryKey]![dataKey]!}"';
        }
      }
    }
    // Append the data to the file.
    await file.writeAsString(output, mode: FileMode.append);
  }
}

bool shouldRemoveWhiteSpace(String dataKey) {
  switch (dataKey) {
    case 'frame_build_times':
      return false;
    case 'frame_rasterizer_times':
      return false;
    case 'frame_begin_times':
      return false;
    case 'frame_rasterizer_begin_times':
      return false;
    default:
      return true;
  }
}
