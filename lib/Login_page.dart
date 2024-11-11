import 'package:flutter/material.dart';
import 'package:shared_pref/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget{

  static const LOGIN_KEY = "login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: ElevatedButton(onPressed: ()async{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool(LOGIN_KEY, true);

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));

        }, child: Text("login")),
      ),
    );
  }

}