/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].

import 'package:flutter/material.dart';
import 'package:vallet_app/screens/parking_places_page.dart';
import 'package:vallet_app/screens/scan_options_page.dart';

import 'my_account_page.dart';

Widget _content = Container(child: ParkingPlacesPage());

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: ButtonMapScreen(),
    );
  }
}

class ButtonMapScreen extends StatefulWidget {
  const ButtonMapScreen({Key? key}) : super(key: key);

  @override
  State<ButtonMapScreen> createState() => _ButtonMapScreen();
}

class _ButtonMapScreen extends State<ButtonMapScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        _content = ParkingPlacesPage();
      } else if (index == 1) {
        _content = ScanOptionsPage();
      } else if (index == 2) {
        _content = MyAccount();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _content,
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontSize: 10),
        unselectedLabelStyle: TextStyle(fontSize: 10),
        selectedItemColor: Color.fromRGBO(0, 83, 131, 1),
        unselectedItemColor: Color.fromRGBO(0, 83, 131, 1),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: "Otopark Bul",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Ödeme Yap',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined,
            ),
            label: 'Hesabım',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
