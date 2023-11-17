// ignore: depend_on_referenced_packages
import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:flutter_driver/flutter_driver.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

/// Save the performance summary.
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

/// Save the timeline to a file.
///
/// [timelineDirectory] is the directory where the timeline will be saved.
/// [fileName] is the name of the file.
///
Future<driver.TimelineSummary> saveTimeLine({
  required driver.Timeline timeline,
  required String timelineDirectory,
  required String fileName,
}) async {
  // Summarize the data.
  final summary = driver.TimelineSummary.summarize(timeline);

  // Write the timeline to a file.
  String destinationDirectory = '$timelineDirectory/$fileName';

  int numberOfFiles = getNumberOfFilesInDirectory(destinationDirectory) ~/ 2;

  await summary.writeTimelineToFile(
    '${fileName}_${numberOfFiles + 1}',
    pretty: true,
    includeSummary: true,
    destinationDirectory: destinationDirectory,
  );

  return summary;
}

/// Get the number of files in the [destinationDirectory].
int getNumberOfFilesInDirectory(String destinationDirectory) {
  int numberOfFiles = 0;

  Directory destination = Directory(destinationDirectory);

  if (destination.existsSync()) {
    Directory(destinationDirectory).listSync().forEach((element) {
      if (element is File) {
        numberOfFiles++;
      }
    });
  }

  return numberOfFiles;
}

/// Save the summaries to a CSV file.
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
