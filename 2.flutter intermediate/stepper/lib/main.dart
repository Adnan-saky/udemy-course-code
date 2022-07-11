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
  int? _current;
  List<Step>? _steps;

  @override
  void initState() {

    _current = 0;
    _steps = <Step>[
      const Step(title: Text('Step 1'), content: Text('Do Something'), isActive: true),
      const Step(title: Text('Step 2'), content: Text('Do Something'), isActive: false),
      const Step(title: Text('Step 3'), content: Text('Do Something'), isActive: false),
    ];
  }

  void _stepContinue() {
    setState(() {
      _current = _current! + 1;
      if(_current! >= _steps!.length) {
        _current = _steps!.length - 1;
      }
    });
  }

  void _stepCancel() {
    setState(() {
      _current = _current! - 1;
      if(_current! < 0) {
        _current = 0;
      }
    });
  }

  void _stepTap(int index) {
    setState(() {
      _current = index;
    });
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
          children:   <Widget>[
            Text("hello world"),
            Container(
              padding: EdgeInsets.all(32),
              child: Center(
                child: Stepper(
                  steps: _steps!,
                  type: StepperType.vertical,
                  currentStep: _current!,
                  onStepContinue: _stepContinue,
                  onStepCancel: _stepCancel,
                  onStepTapped: _stepTap,
                  elevation: 15.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}