import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vallet_app/screens/parking_places_page.dart';
import 'package:vallet_app/screens/scan_options_page.dart';
import 'my_account_page.dart';

Widget _content = Container(child: ParkingPlacesPage());
Color color = Color.fromRGBO(255, 255, 255, 1.0);

class ButtonMapScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<ButtonMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: _content,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: color,
        height: 50,
        items: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              children: <Widget>[
                Icon(Icons.map_outlined),
                Text('Otopark',
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 10))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              children: <Widget>[
                Icon(Icons.qr_code_scanner),
                Text('Öde',
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 10))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              children: <Widget>[
                Icon(Icons.account_circle_outlined),
                Text('Hesabım',
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 10))
              ],
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            if (index == 0) {
              _content = ParkingPlacesPage();
            } else if (index == 1) {
              _content = ScanOptionsPage();
            } else if (index == 2) {
              _content = MyAccount();
            }
          });
        },
      ),
    );
  }
}
