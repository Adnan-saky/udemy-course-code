import 'package:flutter/material.dart';
import 'dart:math';

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
class Area{
  int index;
  String name;
  Color color;
  Area({this.index: -1, this.name: 'Area', this.color: Colors.lightBlueAccent});
}

class _State extends State<MyApp> {
  int? _location;
  List<Area>? _areas;

  @override
  void initState() {
    _areas = <Area>[];
    for(int i=0; i<16;i++){
      _areas?.add(Area(index: i,name: "Area${i+1}"));
    }
    var rng = Random();
    _location = rng.nextInt(_areas!.length);
  }
  void _onclick(int index){
      setState((){
         if(index == _location){
           _areas![index].color = Colors.green;
         }else {
           _areas![index].color = Colors.red;
         }
      });
  }

  Widget _generate(int index){
    return GridTile(
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: RaisedButton(
              onPressed: () => _onclick(index),
              color: _areas![index].color,
              elevation: 8,
              child: Text(_areas![index].name,textAlign: TextAlign.center,),

          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name here'),
      ),
      body:  Container(
        padding:  const EdgeInsets.all(32.0),
        child: GridView.count(crossAxisCount: 4,
        children: List<Widget>.generate(16, _generate),
        )
      ),
    );
  }
}