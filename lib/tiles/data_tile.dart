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
        Text(data.field1),
        Text(data.field2),
        Text(data.field3),
        Text(data.field4),
        Text(data.field5),
        Text(data.field6),
        Text(data.field7),
        Text(data.field8),
        Text(data.field9),
        Text(data.field10),
        Text(data.field11),
        Text(data.field12),
        Text(data.field13),
        Text(data.field14),
        Text(data.field15),
        Text(data.field16),
        Text(data.field17),
        Text(data.field18),
        Text(data.field19),
        Text(data.field20),
      ],
    );
  }
}
