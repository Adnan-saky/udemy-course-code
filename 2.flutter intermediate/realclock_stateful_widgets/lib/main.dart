import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'clock.dart';

void main() {
  runApp( const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name here'),
      ),
      body:  Center(
        child: Container(
          padding:  const EdgeInsets.all(32.0),
          child: Column(
            children:  const <Widget>[
              Text("Time is:"),
              Clock(),
            ],
          ),
        ),
      ),
    );
  }
}
