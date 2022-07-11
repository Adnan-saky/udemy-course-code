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

class Choice {
  String? title;
  IconData? icon;
  Choice({this.title, this.icon});
}

class _State extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController? _controller;
  final List <Choice> _item = <Choice>[
    Choice(title : "Home", icon : Icons.home_outlined),
    Choice(title : "Bike", icon : Icons.directions_bike_outlined),
    Choice(title : "Truck", icon : Icons.car_repair),
    Choice(title : "Cycle", icon : Icons.bike_scooter_outlined),
    Choice(title : "Bus", icon : Icons.directions_bus),
  ];

  @override
  void initState() {
    _controller = TabController(length: _item.length, vsync: this);
    _controller?.animateTo(2);

    _current = 0;
    _steps = <Step>[
      Step(title: Text("Step 1"), content:  Text("Do something"), isActive: true),
      Step(title: Text("Step 2"), content:  Text("Do something"), isActive: true),
      Step(title: Text("Step 3"), content:  Text("Do something"), isActive: true),
    ];
  }
  List<Step>? _steps;
  int? _current;
   void _stepContinue()
   {
     setState((){
           _current = _current! + 1  ;
           if(_current! >= _steps!.length) {
             _current = _steps!.length -1;
           }
     });
   }

   void _stepCancle(){
     setState((){
        _current = _current! - 1;
        if(_current! < 0) {
          _current = 0;
        }
     });
   }
   void _stepTab(int index){
     setState((){
        _current = index;
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appbar"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Theme(
            data: Theme.of(context).copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white) ),
            child: Container(
              height: 48.0,
                alignment: Alignment.center,
              child: TabPageSelector(controller: _controller,),
            ),
          ),
        )
      ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          controller: _controller,
          children: _item.map((Choice item){
            return Container(
              padding: EdgeInsets.all(25.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(item.title!),
                    Icon(item.icon, size: 120.0,)
                  ],
                ),
              ),

            );
          }).toList(),
        ),


    );
  }
}
