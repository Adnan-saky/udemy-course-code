import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

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

class _State extends State<MyApp> {
  Map country = new Map();

  void _getdata() async {
    var url = Uri.parse('http://country.io/names.json');
    var response = await http.get(url);

    if(response.statusCode == 200) {
      setState(() => country = jsonDecode(response.body));
      print('Loaded ${country.length} countries');
    } else {
      print("Status code: ${response.statusCode}");
    }
  }

  @override
  // ignore: must_call_super
  void initState(){
      _getdata();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Name here'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children:  <Widget>[
            const Text(
              "Countries",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (BuildContext context ,int index){
                String key = country.keys.elementAt(index);
                return Row(
                  children: [
                    Text("${key} :\t"),
                    Text("${country[key]}")
                  ],
                );

              },
              itemCount: country.length,
            ))
          ],
        ),
      ),
    );
  }
}
