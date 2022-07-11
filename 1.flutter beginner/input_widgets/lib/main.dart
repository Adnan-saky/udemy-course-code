import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
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
  /// input field
  String _value = "Input Widgets";
  void _onChange(String value) {
    setState(() {
      _value = "Change : $value";
    });
  }

  void _onSubmit(String value) {
    setState(() {
      _value = "submitted : $value";
    });
  }

  /// checkbox
  bool check1 = false;
  bool check2 = false;
  void _onCheck1(bool? value) {
    setState(() {
      check1 = value!;
    });
  }

  void _onCheck2(bool? value) {
    setState(() {
      check2 = value!;
    });
  }

  /// switch
  bool switch1 = false;
  bool switch2 = false;

  void _onSwitch1(bool? value) {
    setState(() {
      switch1 = value!;
    });
  }

  void _onSwitch2(bool? value) {
    setState(() {
      switch2 = value!;
    });
  }

  ///slider
  double sliderValue = 0.0;
  void _onSlide(double value) {
    setState(() {
      sliderValue = value;
    });
  }

  /// date picker
  String dateTime ="";

  Future _dateTimePicker()async{
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(), 
        firstDate: DateTime(2000),
        lastDate: DateTime.now());
    if(picked!=null) {
      setState((){
        dateTime = picked.toString();
      });

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name here'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Text(_value),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Label Text",
                  hintText: "xxx",
                  icon: Icon(Icons.email),
                ),
                autocorrect: true,
                autofocus: true,
                onChanged: _onChange,
                onSubmitted: _onSubmit,
              ),
              Checkbox(
                value: check1,
                onChanged: _onCheck1,
              ),
              CheckboxListTile(
                value: check2,
                onChanged: _onCheck2,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("CheckBox title"),
                subtitle: const Text("CheckBox subtitle"),
                secondary: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              Switch(value: switch1, onChanged: _onSwitch1),
              SwitchListTile(
                value: switch2,
                onChanged: _onSwitch2,
                title: const Text("this is a switch"),
                activeColor: Colors.deepPurpleAccent,
                controlAffinity: ListTileControlAffinity.trailing,
              ),
              Text("Slider Value ${(sliderValue).round()}"),
              Slider(
                value: sliderValue,
                onChanged: _onSlide,
                min: 0,
                max: 100,
                thumbColor: Colors.amber,
                inactiveColor: Colors.brown,
                activeColor: Colors.deepPurpleAccent,
              ),
              ElevatedButton(onPressed: _dateTimePicker, child: const Icon(Icons.calendar_today_outlined)),
              Text("Selected Date $dateTime"),
            ],
          ),
        ),
      ),
    );
  }
}
