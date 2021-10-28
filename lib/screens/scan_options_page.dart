import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:vallet_app/screens/licence_plate_input.dart';
import 'package:vallet_app/screens/parking_fee.dart';
import 'package:vallet_app/services/ticket_service.dart';

class ScanOptionsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<ScanOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(19, 101, 148, 1.0),
        body: Stack(children: [
          Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/loading_gif_white.png"),
                          height: 25.93,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => scanBarcode(),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(19, 101, 148, 1.0),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 2.0,
                              color: Color.fromRGBO(185, 207, 221, 1.0)),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/loading_gif_white.png"),
                            height: 25.93,
                          ),
                          Text('BİLETİNİ TARA',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    ElevatedButton(
                      onPressed:() => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LicensePlate()),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(19, 101, 148, 1.0),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 2.0,
                              color: Color.fromRGBO(185, 207, 221, 1.0)),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/loading_gif_white.png"),
                            height: 25.93,
                          ),
                          Text('PLAKANI GİR',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [],
                ),
              )
            ],
          )
        ]));
  }

  Future<void> scanBarcode() async {
    String ticketId;
    var ticketService = new TicketService();
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      String ticketId = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.DEFAULT);
      ticketService.getTicketById(ticketId).then((ticket) => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ParkingFee(ticket),
              ),
            )
          });
    } on PlatformException {
      ticketId = 'Failed to get platform version.';
    }
  }
}
