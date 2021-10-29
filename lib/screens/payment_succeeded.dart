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
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff005381), Colors.white],
              stops: [0.5, 0.5],
            ),
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              new Container(
                  alignment: Alignment.center,
                  width: 200.0,
                  height: 200.0,
                  decoration: new BoxDecoration(
                    color: Color(0xff2aa555),
                    shape: BoxShape.circle,
                  ),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Text(
                        '32,00 TL',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25.0),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
                      new Text(
                        'Ödeme başarılı',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16.0),
                      ),
                    ],
                  )),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    new Text(
                      'İyi Yolculuklar!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(19, 101, 148, 1.0),
                          fontSize: 16.0),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 50)),
                  ],
                )
              )
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
