import 'package:flutter/material.dart';
import 'package:vallet_app/models/credit_card.dart';
import 'package:vallet_app/services/card_service.dart';

import 'add_credit_card.dart';
import 'button_map_screen.dart';

class CreditCardList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<CreditCardList> {
  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.2,
            ),
            Expanded(child: cardListWidget(context)),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddCreditCard()));
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(
                    BorderSide(color: Color.fromRGBO(19, 101, 148, 1.0)),
                  ),
                  borderRadius: BorderRadius.circular(3.0),
                ),
                width: double.infinity,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: <Widget>[
                      Padding(padding: EdgeInsets.all(5)),
                      Icon(Icons.credit_card,
                          color: Color.fromRGBO(19, 101, 148, 1.0)),
                      Padding(padding: EdgeInsets.all(5)),
                      Text('Yeni Kart Ekle',
                          style: TextStyle(
                              color: Color.fromRGBO(19, 101, 148, 1.0))),
                    ]),
                    Icon(Icons.add, color: Color.fromRGBO(19, 101, 148, 1.0)),
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}

Widget cardListWidget(BuildContext context) {
  final cardService = new CardService();
  return FutureBuilder<List>(
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Center(
            child: Image(
          image: AssetImage("assets/loading.gif"),
          width: MediaQuery.of(context).size.width * 0.3,
        ));
      }
      if (snapshot.hasError) {
        return Center(child: Text('error'));
      }
      return snapshot.data!.isEmpty
          ? Center(
              child: Container(
              child: Text(
                'Henüz Kart Eklemediniz',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ))
          : ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data?.length,
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              itemBuilder: (context, index) {
                CreditCard card = snapshot.data?[index];
                return Card(
                    color: Color.fromRGBO(19, 101, 148, 1.0),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: <Widget>[
                            Icon(Icons.credit_card, color: Colors.white),
                            Padding(padding: EdgeInsets.all(5)),
                            Text(card.cardDesc,
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ]),
                          Text(card.cardNo,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ));
              },
            );
    },
    future: cardService.getCards(),
  );
}
