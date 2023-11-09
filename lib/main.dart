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
        field1: '$index',
        field2: 'field 2',
        field3: 'field 3',
        field4: 'field 4',
        field5: 'field 5',
        field6: 'field 6',
        field7: 'field 7',
        field8: 'field 8',
        field9: 'field 9',
        field10: 'field 10',
        field11: 'field 11',
        field12: 'field 12',
        field13: 'field 13',
        field14: 'field 14',
        field15: 'field 15',
        field16: 'field 16',
        field17: 'field 17',
        field18: 'field 18',
        field19: 'field 19',
        field20: 'field 20',
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
