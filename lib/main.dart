import 'dart:async';
import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main(){runApp(App());}


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    Timer(Duration(seconds: 4), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:
      (context)=>LoginPage(),));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child: Image(
        image: AssetImage("assets/Vallet.jfif")
      )),
      backgroundColor: Color.fromRGBO(19, 101, 148, 1.0),

    );
  }
}
