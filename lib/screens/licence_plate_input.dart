import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:vallet_app/screens/parking_fee.dart';
import 'package:vallet_app/services/ticket_service.dart';

import 'scan_options_page.dart';

class LicensePlate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LicensePlate> {
  TextEditingController plateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ticketService = new TicketService();
    return Scaffold(
        backgroundColor: Color(0xff005381),
        appBar: AppBar(
          backgroundColor: Color(0xff005381),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/loading_gif_white.png',
                fit: BoxFit.contain,
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.all(24.0),
              )
            ],
          ),
          bottom: PreferredSize(
              child: Container(
                child: Divider(color: Colors.white),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              preferredSize: Size.fromHeight(4.0)),
        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Column(children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    // padding: EdgeInsets.fromLTRB(10, 27, 10, 0),
                    child: Image(image: AssetImage("assets/car_icon.png")),
                    height: 60,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Otopark girişinde bilet almadıysan aracının plakasını gir',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    height: 50,
                    child: TextField(
                      controller: plateController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Plakanı Gir',
                          filled: true,
                          fillColor: Color.fromRGBO(185, 207, 221, 1.0),
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          )),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(
                                width: 2.0,
                                color: Color.fromRGBO(185, 207, 221, 1.0)),
                            primary: Color(0xff005381),
                            textStyle: TextStyle(
                              fontSize: 16,
                            )),
                        child: Text('ONAYLA'),
                        onPressed: () {
                          ticketService
                              .getTicketById(plateController.text)
                              .then((ticket) => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ParkingFee(ticket),
                                      ),
                                    )
                                  });
                        },
                      )),
                ],
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'ya da',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Biletini Tara',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
                color: Color(0xff005381),
              ))
            ])));
  }
}
