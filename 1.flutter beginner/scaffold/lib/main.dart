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
  int value = 0;
  void _add() {
    setState(() {
      value++;
    });
  }

  ///date time
  String datetime = "";
  void _datetime() {
    setState(() {
      datetime = DateTime.now().toString();
    });
  }

  ///bottom navbar
  int indexNo = 0;
  void _onNavItemTap(int index) {
    setState(() {
      indexNo = index;
      _value = index.toString();
    });
  }

  String _value = "";

  @override
  //initState() async {
  //_item = List[];
  //_item.add(BottomNavigationBarItem(icon: Icon(Icons.message)))

  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar'),
        actions: [
          IconButton(
              onPressed: _add, icon: const Icon(Icons.add_circle_outline_sharp)),
          IconButton(onPressed: _add, icon: const Icon(Icons.delete_forever)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _datetime,
        hoverColor: Colors.deepPurple,
        hoverElevation: 50,
        splashColor: Colors.red,
        mini: true,
        child: const Icon(Icons.access_time),
      ),
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        elevation: 30,
        child: Container(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                const Text("hello bro"),
                ElevatedButton(onPressed: _add, child: const Text("add"))
              ],
            )),
      ),
      //persistentFooterButtons: [
      //IconButton(onPressed: _add, icon: Icon(Icons.sports_baseball)),
      //IconButton(onPressed: _add, icon: Icon(Icons.sports_football_sharp)),
      //IconButton(onPressed: _add, icon: Icon(Icons.sports_football_outlined)),
      //],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.picture_in_picture_alt),
            label: "Story",
          ),
        ],
        currentIndex: indexNo,
        onTap: _onNavItemTap,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Text(
                value.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              Text(
                datetime,
                style: const TextStyle(fontSize: 30),
              ),
              Text("Index no $_value"),
            ],
          ),
        ),
      ),
    );
  }
}
