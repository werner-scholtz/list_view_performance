import 'package:flutter/material.dart';
import 'package:list_view_performance/models/data.dart';
import 'package:list_view_performance/tiles/data_tile.dart';

class ListViewDefaultPage extends StatefulWidget {
  const ListViewDefaultPage({
    super.key,
    required this.items,
    required this.itemExtent,
  });
  final List<Data> items;
  final double itemExtent;

  @override
  State<ListViewDefaultPage> createState() => _ListViewDefaultPageState();
}

class _ListViewDefaultPageState extends State<ListViewDefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('ListView DataTile'),
      ),
      body: ListView.builder(
        key: const ValueKey('list_view'),
        padding: const EdgeInsets.all(8),
        itemCount: widget.items.length,
        itemExtent: widget.itemExtent,
        itemBuilder: (context, index) {
          final data = widget.items[index];
          return DataTile(
            key: ValueKey(index),
            data: data,
          );
        },
      ),
    );
  }
}
