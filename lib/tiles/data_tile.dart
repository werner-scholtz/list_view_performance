import 'package:flutter/material.dart';
import 'package:list_view_performance/models/data.dart';

/// The [DataTile] widget displays the data from a [Data] object in a row.
class DataTile extends StatelessWidget {
  const DataTile({
    super.key,
    required this.data,
  });

  final Data data;

  @override
  Widget build(BuildContext context) {
    // Generate the text widgets for each field.
    final columns = data.columns.map(
      (e) {
        return Text(e);
      },
    ).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: columns,
    );
  }
}
