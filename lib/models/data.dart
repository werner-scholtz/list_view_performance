class Data {
  Data({
    required this.id,
    required int numberOfFields,
  }) {
    // Generate the columns.
    columns = List.generate(
      numberOfFields,
      (index) {
        if (index == 0) {
          return '$id';
        }
        return '$index';
      },
    );
  }

  final int id;
  late List<String> columns;
}
