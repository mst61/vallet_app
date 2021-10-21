import 'package:flutter/material.dart';
import 'package:vallet_app/screens/credit_card_list.dart';
import 'package:vallet_app/screens/profile_pic.dart';
import 'profile_menu.dart';

class MyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
      child: Column(
        children: [

          ProfilePic(),
          SizedBox(height: 70),
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
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => CreditCardList()));
            },
          ),
          ProfileMenu(
            text: "Yardım Merkezi",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),

        ],
      ),
    );
  }
}