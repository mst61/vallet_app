import 'package:flutter/material.dart';
import 'package:vallet_app/screens/credit_card_list.dart';
import 'package:vallet_app/screens/previous_payments.dart';
import 'package:vallet_app/screens/profile_pic.dart';
import 'profile_menu.dart';

class MyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff005381),
        appBar: AppBar(
          backgroundColor: Color(0xff005381),
          elevation: 0,
          leading: Center(
            child: TextButton(
              onPressed: () => Navigator.of(context).maybePop(),
              child: Image.asset('assets/arrow_left_white.png', width: 18,),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/loading_gif_white.png',
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
                child: Divider(color: Colors.white),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              preferredSize: Size.fromHeight(4.0)),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
          child: Column(
            children: [
              ProfilePic(),
              Padding(padding: EdgeInsets.all(2)),
              Text(
                "Paşa Hazretleri",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.all(5)),
              ProfileMenu(
                text: "Profilim",
                press: () => {},
              ),
              ProfileMenu(
                text: "Geçmiş Ödemelerim",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PreviousPayments()),
                ),
              ),
              ProfileMenu(
                text: "Kayıtlı Kartlarım",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreditCardList()),
                ),
              ),
              ProfileMenu(
                text: "Sözleşmeler",
                press: () {},
              ),
              ProfileMenu(
                text: "Yardım Merkezi",
                press: () {},
              ),
              ProfileMenu(
                text: "Çıkış",
                press: () {},
              ),
            ],
          ),
        ));
  }
}
