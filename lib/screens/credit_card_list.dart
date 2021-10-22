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
        backgroundColor: Color.fromRGBO(19, 101, 148, 1.0),
        appBar: AppBar(
          title: Text('Ödeme Yöntemlerim'),
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ButtonMapScreen()),
                  )),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(19, 60, 83, 1.0),
        ),
        body: Container(
          child: Column(children: [
            cardListWidget(context),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              width: double.infinity, // <-- match_parent
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddCreditCard()),
                  );
                },
                icon: Icon(Icons.add),
                label: Text('Yeni Kart Ekle',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  side: BorderSide(
                      width: 2.0, color: Color.fromRGBO(185, 207, 221, 1.0)),
                  primary: Color.fromRGBO(19, 101, 148, 1.0),
                ),
              ),
            ),
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
              child: Padding(
              padding: EdgeInsets.fromLTRB(
                  0, MediaQuery.of(context).size.height * 0.3, 0, 25),
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
                  shape: new RoundedRectangleBorder(
                      side: new BorderSide(
                          color: Color.fromRGBO(185, 207, 221, 1.0),
                          width: 2.0),
                      borderRadius: BorderRadius.circular(4.0)),
                  child: ListTile(
                    leading: Icon(Icons.credit_card, color: Colors.white),
                    title: Text(card.cardDesc,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    subtitle: Text(card.cardNo,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300)),
                  ),
                );
              },
            );
    },
    future: cardService.getCards(),
  );
}
