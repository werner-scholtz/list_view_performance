import 'dart:io';

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
