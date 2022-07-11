import 'package:flutter/material.dart';
import 'package:push_named/screens/second.dart';

class Home extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name here'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            const Text(
              "This is Home page",
              style: TextStyle(fontSize: 32),
            ),
            ElevatedButton(onPressed: ()=> Navigator.of(context).pushNamed('/Second'), child: const Text("Next"),),
           // ElevatedButton(onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Second()),(Route<dynamic> route) => false),child: const Text("Back"),),
          ],
        ),
      ),
    );
  }
}
