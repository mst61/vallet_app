import 'package:flutter/material.dart';
import 'package:vallet_app/screens/credit_card_list.dart';
import 'package:vallet_app/screens/profile_pic.dart';
import 'profile_menu.dart';

class MyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(19, 101, 148, 1.0),
        appBar: AppBar(
          title: Text('Hesabım'),
          leading: BackButton(color: Colors.white),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(19, 60, 83, 1.0),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: [

              ProfileMenu(
                text: "Profilim",
                icon: "assets/icons/Bell.svg",
                press: () => {},
              ),
              ProfileMenu(
                text: "Geçmiş Ödemelerim",
                icon: "assets/icons/Bell.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Kayıtlı Kartlarım",
                icon: "assets/icons/Settings.svg",
                press: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => CreditCardList()));
                },
              ),
              ProfileMenu(
                text: "Yardım Merkezi",
                icon: "assets/icons/Settings.svg",
                press: () {},
              ),
            ],
          ),
        ));
  }
}
