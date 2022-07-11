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

  int? _turns ;
  double? _value;
  @override
  void initState() {
    _turns = 0;
    _value = 0.0;
  }
  void _onChange(double v){
    setState((){
      _value = v;
      _turns = v.toInt();
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
          padding:  const EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              const Text("Slide to Rotate"),
              Slider(value: _value!, onChanged: _onChange,min: 0,max: 20,),
               //ElevatedButton.icon(onPressed:() => _onChange, label: const Text("Rotate"), icon: const Icon(Icons.rotate_90_degrees_ccw_sharp)),
              RotatedBox(
                quarterTurns: _turns!,
                child: Container(
                  decoration: BoxDecoration(
                    backgroundBlendMode: BlendMode.srcOver,
                    gradient: const RadialGradient(colors: <Color>[Colors.red,Colors.yellow]),
                    border: Border.all(color:  Colors.orange,width: 1.0)
                  ),
                  child: const Image(image: AssetImage("image/smile.png")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}