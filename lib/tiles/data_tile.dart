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
    final columns = data.columns.indexed.map(
      (e) {
        final index = e.$1;
        final value = e.$2;
        final text = Text(value);

        // The first column is the id, so give it a fixed width.
        if (index == 0) {
          return SizedBox(
            width: 52,
            child: text,
          );
        }

        return text;
      },
    ).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: columns,
    );
  }
}
