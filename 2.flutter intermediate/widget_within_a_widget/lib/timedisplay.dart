import 'package:flutter/material.dart';

class TimeDisplay extends StatelessWidget {
  TimeDisplay(
      {Key? key,
      required Color this.color,
      required Duration this.duration,
      required this.onClear})
      : super(key: key);

  Duration duration = Duration();
  Color color = Colors.green;
  final ValueChanged<Duration> onClear;

  void _onClick() {
    onClear(duration);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            duration.toString(),
            style: TextStyle(fontSize: 32, color: color),
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              elevation: 5,
              shape: CircleBorder(),
            ),
            onPressed: _onClick,
            child: Icon(Icons.clear)),
      ],
    );
  }
}
