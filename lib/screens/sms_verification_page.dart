import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vallet_app/models/verify.dart';
import 'package:vallet_app/screens/button_map_screen.dart';
import 'package:vallet_app/screens/scan_options_page.dart';
import 'package:vallet_app/services/auth_service.dart';

class SmsVerificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SmsVerificationPage> {
  bool apiCall = false;
  TextEditingController codeController = TextEditingController();

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
                        controller: codeController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.car_rental_outlined,
                                color: Colors.white),
                            filled: true,
                            fillColor: Color.fromRGBO(185, 207, 221, 1.0),
                            //border: OutlineInputBorder(),
                            labelText: 'SMS İLE GELEN ŞİFREYİ GİRİNİZ',
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
                          child: Text('ONAYLA'),
                          onPressed: () {
                            setState(() {
                              apiCall = true; // Set state like this
                            });
                            _verify(int.parse(codeController.text));
                          },
                        )),
                  ],
                ))
            : Center(child: CircularProgressIndicator()));
  }

  void _verify(int code) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("phoneNumber")) {
      var authService = new AuthService();
      Verify verify = new Verify(code, prefs.getString('phoneNumber') ?? '', false);
      authService.verify(verify).then((verified) {
        setState(() {
          apiCall = false;
        });
        prefs.setBool("verified", true);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ButtonMapScreen()),
        );
      }, onError: (error) {
        setState(() {
          apiCall = false;
        });
      });
    }
  }
}
