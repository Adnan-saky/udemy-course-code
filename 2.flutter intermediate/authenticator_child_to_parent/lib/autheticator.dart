import 'package:flutter/material.dart';


class Authenticator extends StatefulWidget {
  Authenticator({Key? key, required this.onAuthenticated});
  final ValueChanged <bool> onAuthenticated;
  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _AuthenticatorState createState() => _AuthenticatorState(onAuthenticated: onAuthenticated);
}

class _AuthenticatorState extends State<Authenticator> {

  _AuthenticatorState({Key? key, required this.onAuthenticated});

  TextEditingController? _user,_pass;
  late final ValueChanged <bool> onAuthenticated;

  void _onClick(){
    if(_user!.text != "user" || _pass!.text != "123"){
      onAuthenticated(false);
    }else{
      onAuthenticated(true);
    }
  }


  @override
  void initState() {
    _pass = TextEditingController();
    _user = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          TextField(
            controller: _user,
            decoration: InputDecoration(labelText: "UserName"),
          ),
          TextField(
            controller: _pass,
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          Padding(padding: EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: _onClick,
            child: Text("Submit"),
          ),)
        ],
      ),
    );
  }
}