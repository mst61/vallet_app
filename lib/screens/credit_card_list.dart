import 'package:flutter/material.dart';
import 'package:vallet_app/models/credit_card.dart';
import 'package:vallet_app/services/card_service.dart';

class CreditCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(19, 101, 148, 1.0),
        appBar: AppBar(
          title: Text('Ödeme Yöntemlerim'),
          leading: BackButton(color: Colors.white),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(19, 60, 83, 1.0),
        ),
        body: Container(
          child: BodyLayout(),
        ));
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      cardListWidget(context),
      Container(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
        width: double.infinity, // <-- match_parent
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('Yeni Kart Ekle',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(15),
            side: BorderSide(
                width: 2.0, color: Color.fromRGBO(185, 207, 221, 1.0)),
            primary: Color.fromRGBO(19, 101, 148, 1.0),
          ),
        ),
      ),
    ]);
  }
}

Widget cardListWidget(BuildContext context) {
  final cardService = new CardService();
  return FutureBuilder<List>(
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasError) {
        return Center(child: Text('error'));
      }
      return ListView.builder(
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
                    color: Color.fromRGBO(185, 207, 221, 1.0), width: 2.0),
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
