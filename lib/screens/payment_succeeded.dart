import 'package:flutter/material.dart';

class PaymentSucceeded extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<PaymentSucceeded> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(19, 101, 148, 1.0),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromRGBO(19, 101, 148, 1.0), Colors.white],
              stops: [0.5, 0.5],
            ),
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              new Container(
                  alignment: Alignment.center,
                  width: 200.0,
                  height: 200.0,
                  decoration: new BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Text(
                        '32,00 TL',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25.0),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
                      new Text(
                        'Ödeme başarılı',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontSize: 16.0),
                      ),
                    ],
                  )),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 30)),
              new Text(
                'İyi Yolculuklar!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Color.fromRGBO(19, 101, 148, 1.0),
                    fontSize: 24.0),
              ),
            ],
          ) // your body content.
        ));
  }

  void _selectTab(int value) {
    setState(() {
      _current = value;
    });
  }
}
