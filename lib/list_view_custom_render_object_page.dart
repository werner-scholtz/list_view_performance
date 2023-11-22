import 'package:flutter/material.dart';

import 'package:list_view_performance/models/data.dart';
import 'package:list_view_performance/tiles/custom_data_tile.dart';

class ListViewCustomRenderObjectPage extends StatefulWidget {
  const ListViewCustomRenderObjectPage({
    super.key,
    required this.items,
    required this.itemExtent,
  });
  final List<Data> items;
  final double itemExtent;

  @override
  State<ListViewCustomRenderObjectPage> createState() =>
      _ListViewCustomRenderObjectPageState();
}

class _ListViewCustomRenderObjectPageState
    extends State<ListViewCustomRenderObjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('ListView Custom RenderObject'),
      ),
      body: ListView.builder(
        key: const ValueKey('list_view'),
        padding: const EdgeInsets.all(8),
        itemExtent: widget.itemExtent,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final data = widget.items[index];
          return CustomDataTile(
            key: ValueKey(index),
            data: data,
          );
        },
      ),
    );
  }
}
