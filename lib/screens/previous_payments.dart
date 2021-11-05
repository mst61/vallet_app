import 'package:flutter/material.dart';
import 'package:vallet_app/models/payment.dart';
import 'package:vallet_app/screens/payment_succeeded.dart';
import 'package:vallet_app/services/payment_service.dart';


class PreviousPayments extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<PreviousPayments> {
  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Center(
            child: TextButton(
              onPressed: () => Navigator.of(context).maybePop(),
              child: Image.asset('assets/arrow_left_blue.png', width: 18,),
            ),
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
            Expanded(child: cardListWidget(context)),
          ]),
        ));
  }
}

Widget cardListWidget(BuildContext context) {
  final paymentService = new PaymentService();
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
                'Geçmiş ödemeniz bulunmamaktadır',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(19, 101, 148, 1.0),
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
                Payment payment = snapshot.data?[index];
                return Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromRGBO(19, 101, 148, 1.0),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PaymentSucceeded()));
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: <Widget>[
                              Text(payment.paymentDate.toString() + " - " + payment.parkingPlace!.name ,
                                  style: TextStyle(
                                    color: Color.fromRGBO(19, 101, 148, 1.0),
                                  )),
                              Image.asset('assets/arrow_right_blue.png', width: 16,)
                            ]),
                      )
                    ));
              },
            );
    },
    future: paymentService.getPayments(),
  );
}
