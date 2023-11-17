import 'package:flutter/material.dart';
import 'package:list_view_performance/list_view_custom_render_object_page.dart';
import 'package:list_view_performance/models/data.dart';
import 'package:list_view_performance/list_view_default_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Data> data;

  @override
  void initState() {
    super.initState();

    data = List.generate(
      1000000,
      (index) => Data(
        id: index,
        numberOfFields: 36,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
                    data: data,
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
                    data: data,
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
