import 'package:flutter/material.dart';
import 'package:vallet_app/screens/parking_places_page.dart';
import 'package:vallet_app/screens/scan_options_page.dart';

import 'my_account_page.dart';

Widget _content = Container(child: ParkingPlacesPage());

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        _selectedIndex = 0;
        _content = ParkingPlacesPage();
      } else if (index == 1) {
        _selectedIndex = 1;
        _content = ScanOptionsPage();
      } else if (index == 2) {
        _selectedIndex = 2;
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
        unselectedItemColor: Color.fromRGBO(199, 197, 197, 1.0),
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
