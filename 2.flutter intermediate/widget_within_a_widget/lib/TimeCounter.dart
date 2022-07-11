import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:async';
import 'timedisplay.dart';

class TimeCounter extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _TimeCounterState createState() => _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {
  Stopwatch? _watch;
  Timer? _timer;
  Duration? _duration;

  void _onStart() {
    setState(() {
      _watch = Stopwatch();
      _timer = Timer.periodic(Duration(milliseconds: 250), _onTImeOut);
    });
    _watch!.start();
  }

  void _onStop() {
    _timer!.cancel();
    _watch!.stop();
  }
  void _onTImeOut(Timer timer) {
    if(!_watch!.isRunning)return;
    setState((){
       _duration = _watch!.elapsed;
    });
  }
  void _onClear(Duration duration) {
    setState((){
       _duration = Duration();
    });
  }

  @override
  void initState() {
    _duration = Duration();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: <Widget>[
            TimeDisplay(
              color: Colors.black87,
              duration: _duration!,
              onClear: _onClear,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      elevation: 5,
                    ),
                    onPressed: _onStart,
                    child: Text("Start"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      elevation: 5,
                    ),
                    onPressed: _onStop,
                    child: Text("Stop"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
