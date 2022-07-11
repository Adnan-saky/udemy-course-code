import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _State createState() => _State();
}

class MyItem {
  bool? isExpanded;
  late final String? header;
  late final Widget? body;
  MyItem(this.isExpanded, this.header, this.body);
}

class _State extends State<MyApp> {
  final _items = <MyItem>[];

  @override
  void initState() {
    super.initState();
    for (int i = 1; i <= 15; i++) {
      _items.add(
        MyItem(
          false,
          "Item no ${i}",
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Hello World",
            ),
          ),
        ),
      );
    }
  }

  ExpansionPanel _createItem(MyItem item) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Text("${item.header} item"),
        );
      },

      ///https://stackoverflow.com/questions/67598889/the-argument-type-widget-cant-be-assigned-to-the-parameter-type-widget
      isExpanded: item.isExpanded as bool,

      ///isExpanded: item.isExpanded !, ##same
      body: item.body!,

      ///body: item.body as Widget,  ##same
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name here'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          children: [
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _items[index].isExpanded = !_items[index].isExpanded!;
                });
              },
              children: _items.map(_createItem).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
