import 'package:flutter/material.dart';
import 'package:vallet_app/models/ticket.dart';
import 'package:vallet_app/screens/credit_card_list.dart';

class ParkingFee extends StatefulWidget {
  final Ticket ticket;
  const ParkingFee(this.ticket);

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<ParkingFee> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Otopark ücreti'),
        leading: BackButton(color: Colors.white),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(19, 60, 83, 1.0),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Column(
          children: <Widget>[
            Expanded(
              child:
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          new Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.location_city, size: 14),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'İşletme: Parktürk Şişhane',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                          new Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.login, size: 14),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Giriş saati: 12:24',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                          new Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.logout, size: 14),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Çıkış saati: 13:24',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                          new Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.money, size: 25),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      widget.ticket.price.toString() + ' TL',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25.0),
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CreditCardList()
                        )
                      );
                    },
                    icon: Icon(Icons.payment),
                    label: Text('Ödeme Yöntemi Seç',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      fixedSize:
                          new Size(MediaQuery.of(context).size.width - 40, 50),
                      padding: EdgeInsets.all(15),
                      side: BorderSide(
                          width: 2.0,
                          color: Color.fromRGBO(185, 207, 221, 1.0)),
                      primary: Color.fromRGBO(19, 101, 148, 1.0),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _selectTab(int value) {
    setState(() {
      _current = value;
    });
  }
}
