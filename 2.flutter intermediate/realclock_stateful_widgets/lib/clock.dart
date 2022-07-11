import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  String? _value;
  Timer? _timer;

  @override
  void initState() {
    _timer =  Timer.periodic(Duration(seconds: 1),_onTimer);
  }
  void _onTimer(Timer timer){
    var now = DateTime.now();
    var formatter = DateFormat('hh:mm:ss');
    String formatted = formatter.format(now);
    setState((){
        _value = formatted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_value!,style: TextStyle(fontSize: 32.0),);
  }
}