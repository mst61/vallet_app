import 'package:flutter/material.dart';

enum TabItem { OtoparkBul, OdemeYap, Hesabim }

const Map<TabItem, String> tabName = {
  TabItem.OtoparkBul: 'Otopark Bul',
  TabItem.OdemeYap: 'Ödeme Yap',
  TabItem.Hesabim: 'Hesabım',
};



const Map<TabItem, IconData> categories = {

  TabItem.OtoparkBul: Icons.map_outlined,
  TabItem.OdemeYap: Icons.qr_code_scanner,
  TabItem.Hesabim: Icons.account_circle_outlined,

};



class MyApp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}


class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(

        body: const Center(
          child: Text('Hello Melih'),
        ),
      ),
    );
  }
}

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: Text('Hello İrem'),
        ),
      ),
    );
  }
}