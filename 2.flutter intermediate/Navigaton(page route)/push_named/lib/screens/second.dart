import 'package:flutter/material.dart';
import 'package:push_named/screens/third.dart';


class Second extends StatefulWidget {

  @override
  // ignore: library_private_types_in_public_api
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
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
            const Text("This is Page 2",style: TextStyle(fontSize: 32),),
            ElevatedButton(onPressed: ()=> Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (Context)=> Third()), (route) => false), child: const Text("Next"),),
            ElevatedButton(onPressed: ()=> Navigator.of(context).pop(), child: const Text("Back"),),

          ],
        ),
      ),
    );
  }
}