import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vallet_app/navigationbar/static_navigation_bar.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'DinPro'
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool verified = prefs.getBool("verified") ?? false;
      if (verified) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => StaticNavigationBar()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => StaticNavigationBar()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image(
        image: AssetImage("assets/vallet_app.gif"),
        width: MediaQuery.of(context).size.width * 0.8,
      )),
      backgroundColor: Color.fromRGBO(0, 83, 129, 1),
    );
  }
}
