import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vallet_app/models/user.dart';
import 'package:vallet_app/services/auth_service.dart';

import 'sms_verification_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  bool apiCall = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(19, 101, 148, 1.0),
        body: !apiCall
            ? Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Image(image: AssetImage("assets/Vallet.jfif")),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.account_circle_outlined,
                                color: Colors.white),
                            filled: true,
                            fillColor: Color.fromRGBO(185, 207, 221, 1.0),
                            //border: OutlineInputBorder(),
                            labelText: 'Ad Soyad',
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: TextField(
                        obscureText: true,
                        controller: phoneController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_open_outlined,
                                color: Colors.white),
                            filled: true,
                            fillColor: Color.fromRGBO(185, 207, 221, 1.0),
                            // border: OutlineInputBorder(),
                            labelText: 'Telefon Numarası',
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                      ),
                    ),
                    Container(
                        height: 70,
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                  width: 2.0,
                                  color: Color.fromRGBO(185, 207, 221, 1.0)),
                              primary: Color.fromRGBO(19, 101, 148, 1.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              textStyle: TextStyle(
                                fontSize: 18,
                              )),
                          child: Text('SMS KODU GÖNDER'),
                          onPressed: () {
                            setState(() {
                              apiCall = true;
                            });
                            _registerUser(context);
                          },
                        )),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 220, 0, 0),
                        child: Row(
                          children: <Widget>[
                            TextButton(
                              onPressed: () {
                                //Kayıt Sayfası
                              },
                              child: Text('Hemen Katılın',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromRGBO(185, 207, 221, 1.0),
                                      decoration: TextDecoration.underline)),
                              style: TextButton.styleFrom(
                                primary: Color.fromRGBO(185, 207, 221, 1.0),
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ))
                  ],
                ))
            : Center(child: CircularProgressIndicator()));
  }

  void _registerUser(BuildContext context) {
    var authService = new AuthService();
    User user = new User.fromNameAndPhoneNumber(
        nameController.text, phoneController.text);
    authService.register(user).then((registeredUser) async {
      setState(() {
        apiCall = false;
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("phoneNumber", user.phoneNumber);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SmsVerificationPage()),
      );
    }, onError: (error) {
      setState(() {
        apiCall = false;
      });
    });
  }
}
