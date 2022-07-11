import 'package:flutter/material.dart';

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
   String _value = "Hello World";
   int num = 0;


  void _onpressed()
  {
    setState((){
    _value = DateTime.now().toString();
    });

  }
  void _onPressedTextButton()
  {
    setState((){
      _value = "Text button pressed";
    });

  }

  void _add()
  {
    setState((){
      num++;
    });
  }

  void _substract(){
    setState((){
       num--;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name here'),
      ),
      body:  Center(
        child: Container(
          padding:  const EdgeInsets.all(50.0),
          child: Column(
            children: <Widget>[
              Text(_value),
              ElevatedButton(onPressed: _onpressed, child: const Text("hit me")),
              TextButton(onPressed: _onPressedTextButton, child: const Text("I'm a text button")),
              Text("Count = $num"),
              IconButton(onPressed: _add, icon: Icon(Icons.add)),
              IconButton(onPressed: _substract, icon: Icon(Icons.remove))


            ],
          ),
        ),
      ),
    );
  }
}