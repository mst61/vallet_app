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
        backgroundColor: Color(0xff005381),
        appBar: AppBar(
          backgroundColor: Color(0xff005381),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/loading_gif_white.png',
                fit: BoxFit.contain,
                height: 24,
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
        body: Column(children: <Widget>[
          Expanded(
              child: new Container(

          )),
          Container(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => scanBarcode(),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(30),
                        primary: Color(0xff005381),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            side: BorderSide(
                                width: 1.0,
                                color: Color.fromRGBO(255, 255, 255, 1.0))),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 60,
                              child: Image(
                                image: AssetImage("assets/scanning_icon.png"),
                              )),
                          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                          Text('BİLETİNİ TARA',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LicensePlate()),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(30),
                        primary: Color(0xff005381),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          side: BorderSide(
                              width: 1.0,
                              color: Color.fromRGBO(255, 255, 255, 1.0)),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 60,
                              child: Image(
                                image: AssetImage("assets/car_icon.png"),
                              )),
                          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                          Text('PLAKANI GİR',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(10)),
                Flexible(
                  child: Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Text(
                        'Otopark girişinde aldığın fiziksel bileti tara.',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        'Otopark girişinde bilet almadıysan aracının plakasını gir.',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                )
              ],
            ),
            color: Color(0xff005381),
          ),
          Expanded(
              child: Container(
            color: Color(0xff005381),
          )),
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
