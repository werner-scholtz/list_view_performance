import 'package:flutter/material.dart';
import 'package:list_view_performance/list_view_custom_data_tile.dart';
import 'package:list_view_performance/models/data.dart';
import 'package:list_view_performance/list_view_data_tile.dart';

void main() {
  // Generate a list of 1 million Data items.
  final items = List.generate(
    1000000,
    (index) => Data(
      id: index,
      numberOfFields: 40,
    ),
  );

  runApp(
    MyApp(items: items),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.items,
  });
  final List<Data> items;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        items: items,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.items});

  final List<Data> items;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// The item extent for the list view,
  /// this is to force both lists to display the same amount of items in the viewport.
  ///
  /// A cheap trick to improve performance would be to make this value larger so fewer items are displayed at a time.
  final itemExtent = 24.0;

  /// The width of the id column.
  final idWidth = 52.0;

  @override
  Widget build(BuildContext context) {
    // The default ListView.
    final dataTileListView = ListTile(
      key: const ValueKey('data_tile_list_view'),
      title: const Text('ListView DataTile'),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ListViewDataTilePage(
              items: widget.items,
              itemExtent: itemExtent,
              idWidth: idWidth,
            ),
          ),
        );
      },
    );

    // The custom RenderObject ListView.
    final customDataTileListView = ListTile(
      key: const ValueKey('custom_data_tile_list_view'),
      title: const Text('ListView CustomDataTile'),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ListViewCustomDataTilePage(
              items: widget.items,
              itemExtent: itemExtent,
              idWidth: idWidth,
            ),
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('List View Performance'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          dataTileListView,
          customDataTileListView,
        ],
      ),
    );
  }
}
