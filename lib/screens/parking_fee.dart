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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: Color.fromRGBO(19, 101, 148, 1.0)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/loading_gif_blue.png',
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
              child: Divider(color: Color.fromRGBO(19, 101, 148, 1.0)),
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
        child: Column(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Container()),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(
                        BorderSide(
                            width: 1.0,
                            color: Color.fromRGBO(19, 101, 148, 1.0)),
                      ),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        new Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/loading_gif_blue.png',
                                      fit: BoxFit.contain,
                                      height: 10,
                                    ),
                                    Text(
                                      'İşletme: ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color.fromRGBO(19, 101, 148, 1.0),
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ]
                                ),
                                Container(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    ' Parktürk Şişhane',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromRGBO(19, 101, 148, 1.0),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        new Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_forward_ios, size: 10, color: Color.fromRGBO(19, 101, 148, 1.0),),
                                      Text(
                                        ' Çıkış saati:',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color.fromRGBO(19, 101, 148, 1.0),
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    ' 13:24',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromRGBO(19, 101, 148, 1.0),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        new Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(2.0),
                                  child:
                                      Row(
                                        children: [
                                          Icon(Icons.arrow_back_ios, size: 10, color: Color.fromRGBO(19, 101, 148, 1.0),),
                                          Text(
                                            ' Çıkış saati:',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color.fromRGBO(19, 101, 148, 1.0),
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                ),
                                Container(
                                  child: Text(
                                    ' 13:24',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromRGBO(19, 101, 148, 1.0),
                                      fontSize: 12.0,
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    widget.ticket.price.toString() + ' TL',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromRGBO(19, 101, 148, 1.0),
                                        fontSize: 32.0),
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreditCardList()));
                    },
                    icon: Icon(Icons.payment),
                    label: Text('Ödeme Yöntemi Seç',
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      fixedSize:
                          new Size(MediaQuery.of(context).size.width - 60, 40),
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
}
