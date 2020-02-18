import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/profilePage.dart';
import './pages/animTest.dart';
import './pages/Animtwo.dart';
void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner:false,
      routes: <String, WidgetBuilder>{
        "/home": (BuildContext context) => new Home(),
        "/auth": (BuildContext context) => new ProfilePage(),
        "/anim": (BuildContext context) => new AnimTest(),
        "/anim2": (BuildContext context) => new AnimTwo()
      },
      initialRoute: "/home",
      title: 'Flutter Nav',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Home(),
    );
  }
}