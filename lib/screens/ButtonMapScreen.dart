import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vallet_app/screens/parking_places_page.dart';
import 'package:vallet_app/services/parking_place_service.dart';
import 'MyAccountPage.dart';
import 'credit_card_list.dart';
import 'licence_plate_input.dart';
import 'scan_options_page.dart';

Widget _content = Container(
    child: ParkingPlacesPage()
);
Color color = Color.fromRGBO(19, 101, 148, 1.0);
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
         height:75,
        items: [

          Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              children: <Widget>[
                Icon(Icons.map_outlined),
                Text('Otopark Bul',textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12))
              ],
            ),
          ),

        //  Icon(Icons.map_outlined),

          Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              children: <Widget>[
                Icon(Icons.qr_code_scanner),
                Text('Biletini Tara',textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12))
              ],
            ),
          ),

        //  Icon(Icons.qr_code_scanner),


          Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              children: <Widget>[
                Icon(Icons.car_rental ),
                Text('Plaka Girişi',textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12))
              ],
            ),
          ),

          // Icon(Icons.car_rental ),

          Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              children: <Widget>[
                Icon(Icons.account_circle_outlined),
                Text('Hesap Vallet',textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12))
              ],
            ),
          ),

        //  Icon(Icons.account_circle_outlined)
        ],

        onTap: (index){
          setState(() {
            if (index ==0 ){
              _content = ParkingPlacesPage();
            }
            else if (index ==1){
              _content =  FlutterBarcodeScanner.scanBarcode(
                  "#ff6666", "Cancel", false, ScanMode.DEFAULT) as Widget;
            }
            else if (index ==2){
              _content = LicensePlate();
            }
            else if (index ==3){
              _content = MyAccount();
            }
          });
        },
      ),);
  }
}

