import 'package:flutter/material.dart';
import 'package:list_view_performance/models/data.dart';
import 'package:list_view_performance/tiles/data_tile.dart';

class ListViewDefaultPage extends StatefulWidget {
  const ListViewDefaultPage({super.key, required this.data});
  final List<Data> data;
  @override
  State<ListViewDefaultPage> createState() => _ListViewDefaultPageState();
}

class _ListViewDefaultPageState extends State<ListViewDefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('ListView Default'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: widget.data.length,
        prototypeItem: DataTile(data: widget.data.first),
        itemBuilder: (context, index) {
          final data = widget.data[index];
          return DataTile(
            key: ValueKey(index),
            data: data,
          );
        },
      ),
    );
  }
}
