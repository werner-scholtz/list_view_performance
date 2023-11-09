import 'package:flutter/material.dart';

import 'package:list_view_performance/models/data.dart';
import 'package:list_view_performance/tiles/custom_data_tile.dart';

class ListViewCustomRenderObjectPage extends StatefulWidget {
  const ListViewCustomRenderObjectPage({super.key, required this.data});
  final List<Data> data;

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
        padding: const EdgeInsets.all(8),
        prototypeItem: CustomDataTile(data: widget.data.first),
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          final data = widget.data[index];
          return CustomDataTile(
            data: data,
            key: ValueKey(index),
          );
        },
      ),
    );
  }
}
