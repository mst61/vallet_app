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
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff005381),
        body: !apiCall
            ? Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage("assets/Vallet.png"), width:  MediaQuery.of(context).size.width * 0.5,),
                          Padding(padding: EdgeInsets.all(10)),
                          Text("PARK ET, ONLINE ÖDE, KOLAY ÇIK!",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.4,
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        children: [
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                hintText: 'İsim, Soyisim',
                                hintStyle: TextStyle(fontSize: 12.0, color: Colors.white),
                                filled: true,
                                fillColor: Color.fromRGBO(185, 207, 221, 1.0),
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                )),
                          ),
                          Padding(padding: EdgeInsets.all(10)),
                          TextField(
                            controller: phoneController,
                            decoration: InputDecoration(
                                hintText: 'Telefon Numarası',
                                hintStyle: TextStyle(fontSize: 12.0, color: Colors.white),
                                filled: true,
                                fillColor: Color.fromRGBO(185, 207, 221, 1.0),
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                )),
                          ),
                          Padding(padding: EdgeInsets.all(10)),
                          Text("Girdiğin numaraya tek kullanımlık onay kodu göndereceğiz.",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white), textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            child: Container(
                              margin: const EdgeInsets.all(12),
                              child: const Text(
                                'DEVAM ET',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                apiCall = true;
                              });
                              _registerUser(context);
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize:
                              new Size(MediaQuery.of(context).size.width - 60, 40),
                              side: BorderSide(
                                  width: 1.0,
                                  color: Colors.white),
                              primary: Color(0xff005381),
                            ),
                          )
                        ],
                      ),
                    ),
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
