import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/second.dart';
import './screens/third.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigation",
      routes: <String,WidgetBuilder>{
        // All available page
        '/Home': (BuildContext context) => Home(),
        '/Second': (BuildContext context) => Second(),
        '/Third': (BuildContext context) => Third(),
      },
      home: Home(),
    );
  }
}