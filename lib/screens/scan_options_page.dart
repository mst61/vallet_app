import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:vallet_app/screens/licence_plate_input.dart';

class ScanOptionsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<ScanOptionsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          leading: const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: ClipRect(
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage('assets/Vallet.jfif'),
              ),
            ),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(20, 200, 20, 0),
              ),

                Container(
                    height: 70,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 2.0,
                              color: Color.fromRGBO(185, 207, 221, 1.0)),
                          primary: Color.fromRGBO(19, 101, 148, 1.0),
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          textStyle: TextStyle(
                            fontSize: 18,
                          )),
                      child: Text('BİLETİNİ TARA'),
                      onPressed: () {
                        FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", false, ScanMode.DEFAULT);
                      },
                    )),

                Container(
                    height: 70,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 2.0,
                              color: Color.fromRGBO(185, 207, 221, 1.0)),
                          primary: Color.fromRGBO(19, 101, 148, 1.0),
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          textStyle: TextStyle(
                            fontSize: 18,
                          )),
                      child: Text('PLAKANI GİR'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LicensePlate()),
                        );
                      },
                    )),
              ],
            )));
  }

}