import 'package:flutter/material.dart';
import 'package:list_view_performance/models/data.dart';

class DataTile extends StatelessWidget {
  const DataTile({
    super.key,
    required this.data,
  });

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${data.id}'),
        for (var i = 0; i < data.numberOfFields; i++) Text(data.field(i))
      ],
    );
  }
}
