import 'package:flutter/material.dart';
import 'package:shared_pref/Login_page.dart';
import 'package:shared_pref/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(Myapp());
}
class Myapp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyappState();
}
class _MyappState extends State<Myapp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splashpage(),
    );
  }
}

class Homepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>{

  var nameController = TextEditingController();
  var name = "";

  @override

  @override
  void initState() {
    super.initState();

    getValueFromPrefs();


  }

  getValueFromPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name") ?? "";
    setState(() {

    });
  }





  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        title: Text("HOME",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ///log out Button
            Row(
              children: [
                ElevatedButton(onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.clear();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));

                }, child: Icon(Icons.logout_rounded),
                ),
              ],
            ),

            ///TEXT
            Text(name!= "" ? "Welcome $name" :""),
            TextField(
              controller: nameController,
            ),
            ElevatedButton(onPressed: () async {
              ///Store the name
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.setString("name", nameController.text);
            }, child: Text("Save")),
          ],
        ),
      ),
    );
  }
}
