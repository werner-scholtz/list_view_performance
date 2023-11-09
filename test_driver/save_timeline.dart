// ignore: depend_on_referenced_packages
import 'package:flutter_driver/flutter_driver.dart' as driver;

import 'get_number_of_files_in_directory.dart';

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
