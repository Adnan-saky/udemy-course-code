import 'package:flutter/material.dart';
import 'package:push_named/screens/second.dart';


class Third extends StatefulWidget {

  @override
  // ignore: library_private_types_in_public_api
  _ThirdState createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name here'),
      ),
      body:  Container(
        padding:  const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            const Text("This is Page 3",style: TextStyle(fontSize: 32),),
            ElevatedButton(onPressed: ()=> Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (Context) => Second()), (Route<dynamic> route) => false), child: Text("Back"),),
          ],
        ),
      ),
    );
  }
}