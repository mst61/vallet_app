import 'package:flutter/material.dart';
import 'package:vallet_app/models/credit_card.dart';
import 'package:vallet_app/services/card_service.dart';

class CreditCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ödeme Yöntemlerim'),
          backgroundColor: Color.fromRGBO(19, 101, 148, 1.0),
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
          label: Text(
            'Yeni Kart Ekle',
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(15),
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
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        itemBuilder: (context, index) {
          CreditCard card = snapshot.data?[index];
          return Card(
            //                           <-- Card widget
            child: ListTile(
              leading: Icon(Icons.credit_card),
              title: Text(card.cardDesc),
              subtitle: Text(card.cardNo),
            ),
          );
        },
      );
    },
    future: cardService.getCards(),
  );
}
