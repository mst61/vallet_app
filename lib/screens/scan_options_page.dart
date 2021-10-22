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
        appBar: AppBar(
          title: Text('Ödeme Yöntemi'),
          leading: BackButton(color: Colors.white),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(19, 60, 83, 1.0),
        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  decoration: BoxDecoration(
                    border: Border.fromBorderSide(
                      BorderSide(
                          width: 1.0,
                          color: Color.fromRGBO(185, 207, 221, 1.0)),
                    ),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      new Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.payment, size: 24, color: Colors.white,),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'Lütfen Ödeme Yönteminizi seçiniz',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0,
                                    color: Colors.white
                                  ),
                                ),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 70,
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ElevatedButton.icon(
                      onPressed: () => scanBarcode(),
                      icon: Icon(Icons.qr_code),
                      label: Text('BİLETİNİ TARA',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(

                        padding: EdgeInsets.all(15),
                        side: BorderSide(
                            width: 1.0,
                            color: Color.fromRGBO(185, 207, 221, 1.0)),
                        primary: Color.fromRGBO(19, 101, 148, 1.0),
                      ),
                    )),
                Container(
                    height: 70,
                    padding: EdgeInsets.fromLTRB(0, 10, 00, 0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LicensePlate()),
                        );
                      },
                      icon: Icon(Icons.car_rental),
                      label: Text('PLAKANI GİR',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(

                        padding: EdgeInsets.all(15),
                        side: BorderSide(
                            width: 1.0,
                            color: Color.fromRGBO(185, 207, 221, 1.0)),
                        primary: Color.fromRGBO(19, 101, 148, 1.0),
                      ),
                    )),
              ],
            )));
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
