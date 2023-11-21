import 'package:flutter/material.dart';
import 'package:list_view_performance/list_view_custom_render_object_page.dart';
import 'package:list_view_performance/models/data.dart';
import 'package:list_view_performance/list_view_default_page.dart';

void main() {
  // Generate a list of 1 million Data items.
  final items = List.generate(
    1000000,
    (index) => Data(
      id: index,
      numberOfFields: 20,
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('List View Performance'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ListTile(
            key: const ValueKey('default_list_view'),
            title: const Text('Default ListView'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListViewDefaultPage(
                    items: widget.items,
                  ),
                ),
              );
            },
          ),
          ListTile(
            key: const ValueKey('custom_list_view'),
            title: const Text('Custom RenderObject ListView'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListViewCustomRenderObjectPage(
                    items: widget.items,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
