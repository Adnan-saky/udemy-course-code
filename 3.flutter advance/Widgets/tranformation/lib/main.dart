import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(),);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _State createState() => _State();
}

class _State extends State<MyApp> {
  bool _themetoggle = false;

  void _onTogol(bool val){
    setState((){
      _themetoggle = val;
    });

  }

  double? X,Y,Z;
  @override
  void initState() {
    X = 0.0;
    Y = 0.0;
    Z = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _themetoggle? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          leading: Switch(value: _themetoggle, onChanged: _onTogol,
          activeColor: Colors.white,
          inactiveThumbColor: Colors.yellow,),
          title:  Text("${_themetoggle.toString()}"),
        ),
        body:  Center(
          child: Container(
            padding:  const EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    const Text("X"),
                    Slider(min: 0, max: 1,value: X!, onChanged: (double v) => setState(() => X = v)),
                  ],
                ),
                Row(
                  children: [
                    const Text("Y"),
                    Slider(min: 0, max: 1,value: Y!, onChanged: (double v) => setState(() => Y = v)),
                  ],
                ),
                Row(
                  children: [
                    const Text("Z"),
                    Slider(min: 0, max: 6.3,value: Z!, onChanged: (double v) => setState(() => Z = v)),
                  ],
                ),
                Transform(transform: Matrix4.skewY(Y!),
                  child:Transform(transform: Matrix4.skewX(X!),
                      child: Transform(transform: Matrix4.rotationZ(Z!),
                        child: const Padding(padding: EdgeInsets.all(10),child: Text("Hey BUDDY",style: TextStyle(fontSize: 32),)),)
                      ),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}