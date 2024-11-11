import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_pref/Login_page.dart';
import 'package:shared_pref/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () async {
      ///Navigator To ?
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool check = prefs.getBool(LoginPage.LOGIN_KEY) ?? false;

      Widget navigateTo = LoginPage();

      if(check){
        navigateTo = Homepage();
      }

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>navigateTo));

     /* if (check) {

        Navigator.pushReplacement(
            context, MaterialPageRoute(
            builder: (context) => Homepage(),
        ));
      } else {
        (Navigator.push(
            context, MaterialPageRoute(
          builder: (context) => LoginPage(),
        )));
      }*/

    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: FlutterLogo(
          size: 200,
        ),
      ),
    );
  }
}
