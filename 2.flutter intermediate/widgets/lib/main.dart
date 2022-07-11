import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
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
  /// ----------------------toolTip------------------------------
  String _value = "dateTime";
  void _onPressed() => setState(() => _value = DateTime.now().toString());

  ///------------------------ chip-----------------------
  int clickCount = 0;
  int count = 1;
  final List<Widget> _list = <Widget>[];

  @override
  // ignore: must_call_super

  void _onClick() {
    Widget child = _newItem(count);
    setState(() {
      if (clickCount > 4) {
        const text = 'maximum no of chips added';
        final snackBar = SnackBar(
            content: Text(text),
            elevation: 25.0,
            backgroundColor: Colors.red,
            action: SnackBarAction(
              label: "dismiss",
              onPressed: () => print("a"),
            ));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        _list.add(child);
        clickCount++;
      }
    });
  }

  void _removeItem(Key key) {
    for (int i = 0; i < _list.length; i++) {
      Widget child = _list.elementAt(i);
      if (child.key == key) {
        setState(() => _list.removeAt(i));
      }
    }
  }

  Widget _newItem(int i) {
    Key key = Key('item_${i}');
    Container child = Container(
      key: key,
      padding: const EdgeInsets.all(10.0),
      child: Chip(
        label: Text("${i}"),
        backgroundColor: Colors.white,
        shape: const StadiumBorder(
            side: BorderSide(
          color: Colors.lightBlueAccent,
        )),
        deleteIcon: const Icon(Icons.done),
        deleteIconColor: Colors.blueAccent,
        deleteButtonTooltipMessage: "Done",
        elevation: 5.0,
        onDeleted: () => _removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Text("${i}"),
        ),
      ),
    );
    count++;
    return child;
  }

  /// ----------- slider + progressbar(linear & circular) -----------------------
  double _val = 0.0;
  void _onChange(double i) {
    setState(() {
      _val = i;
    });
  }

  ///---------- progressbar with time duration-----------------
  static Duration duration = new Duration(milliseconds: 100);
  late Timer timer;
  double _valu = 0.0;
  bool _active = false;

  void _timeout(Timer timer) {
    if (!_active) return;
    setState(() {
      _valu += 0.009;
      if (_valu == 1) _active = false;
    });
  }

  void _onBtnpress() {
    setState(() {
      _valu = 0;
      _active = true;
    });
  }

  @override
  void initState() {
    timer = Timer.periodic(duration, _timeout);
    for (int i = 1; i < 2; i++) {
      Widget child = _newItem(i);
      _list.add(child);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar here'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClick,
        elevation: 15,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32.0),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: <Widget>[
                Text(_value),
                IconButton(
                  onPressed: _onPressed,
                  icon: const Icon(Icons.punch_clock),
                  tooltip: "Date Time show",
                ),
                Wrap(
                  spacing: MediaQuery.of(context).size.width*.01,
                  children: _list,
                ),
                Text((_val * 100).floor().toString()),
                Slider(
                  value: _val,
                  onChanged: _onChange,
                ),
                LinearProgressIndicator(
                  value: _val,
                  valueColor: const AlwaysStoppedAnimation(Colors.deepPurple),
                ),
                SizedBox(
                  child: Container(
                    height: 20,
                  ),
                ),
                CircularProgressIndicator(
                  value: _val,
                  color: Colors.blue,
                ),
                SizedBox(
                  child: Container(
                    height: 20,
                  ),
                ),
                SizedBox(
                  child: Container(
                    height: 20,
                  ),
                ),
                LinearProgressIndicator(
                  value: _valu,
                  color: Colors.red,
                ),
                SizedBox(
                  child: Container(
                    height: 20,
                  ),
                ),
                CircularProgressIndicator(
                  value: _valu,
                  color: Colors.red,
                ),
                SizedBox(
                  child: Container(
                    height: 20,
                  ),
                ),
                ElevatedButton(
                  onPressed: _onBtnpress,
                  style: ElevatedButton.styleFrom(primary: Colors.red,elevation: 5,surfaceTintColor: Colors.black),
                  child: const Icon(Icons.play_circle_outline_sharp,),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
