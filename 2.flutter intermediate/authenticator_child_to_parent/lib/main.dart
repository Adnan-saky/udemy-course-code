import 'package:flutter/material.dart';
import 'autheticator.dart';
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

  bool? _isAuthenticated;

  void _onAuthenticated(bool value){
    setState((){
       _isAuthenticated = value;
    });
  }

  @override
  void initState() {
    _isAuthenticated = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name here'),
      ),
      body:  Container(
        padding:  const EdgeInsets.all(32.0),
        child: Column(
          children:  <Widget>[
            Text("hello world"),
            Authenticator(onAuthenticated: _onAuthenticated,),
            Text("Authenticated : ${_isAuthenticated}",style: TextStyle(color: _isAuthenticated == true ? Colors.green : Colors.red),)
          ],
        ),
      ),
    );
  }
}