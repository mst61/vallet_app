import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'scan_options_page.dart';

class LicensePlate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LicensePlate> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(19, 101, 148, 1.0),
        appBar: AppBar(
          title: Text('Ödeme Yöntemlerim'),
          leading: BackButton(color: Colors.white),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(19, 60, 83, 1.0),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Image(image: AssetImage("assets/Vallet.jfif")),
                  height: 150,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.car_rental_outlined,
                            color: Colors.white),
                        filled: true,
                        fillColor: Color.fromRGBO(185, 207, 221, 1.0),
                        //border: OutlineInputBorder(),
                        labelText: 'PLAKA',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                  ),
                ),
                Container(

                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(
                              width: 2.0,
                              color: Color.fromRGBO(185, 207, 221, 1.0)),
                          primary: Color.fromRGBO(19, 101, 148, 1.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          textStyle: TextStyle(
                            fontSize: 16,
                          )),
                      child: Text('ONAYLA'),
                      onPressed: () {
                        print(nameController.text);
                      },
                    )),
              ],
            )));
  }
}
