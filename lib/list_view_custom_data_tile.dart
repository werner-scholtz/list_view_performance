import 'package:flutter/material.dart';

import 'package:list_view_performance/models/data.dart';
import 'package:list_view_performance/tiles/custom_data_tile.dart';

class ListViewCustomDataTilePage extends StatefulWidget {
  const ListViewCustomDataTilePage({
    super.key,
    required this.items,
    required this.itemExtent,
    required this.idWidth,
  });
  final List<Data> items;
  final double itemExtent;
  final double idWidth;

  @override
  State<ListViewCustomDataTilePage> createState() =>
      _ListViewCustomDataTilePageState();
}

class _ListViewCustomDataTilePageState
    extends State<ListViewCustomDataTilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('ListView CustomDataTile'),
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
            idWidth: widget.idWidth,
          );
        },
      ),
    );
  }
}
