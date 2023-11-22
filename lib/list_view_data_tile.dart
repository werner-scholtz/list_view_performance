import 'package:flutter/material.dart';
import 'package:list_view_performance/models/data.dart';
import 'package:list_view_performance/tiles/data_tile.dart';

class ListViewDataTilePage extends StatefulWidget {
  const ListViewDataTilePage({
    super.key,
    required this.items,
    required this.itemExtent,
    required this.idWidth,
  });
  final List<Data> items;
  final double itemExtent;
  final double idWidth;

  @override
  State<ListViewDataTilePage> createState() => _ListViewDataTilePageState();
}

class _ListViewDataTilePageState extends State<ListViewDataTilePage> {
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
            idWidth: widget.idWidth,
          );
        },
      ),
    );
  }
}
