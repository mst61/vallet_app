import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vallet_app/models/verify.dart';
import 'package:vallet_app/services/auth_service.dart';

import 'button_map_screen.dart';

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
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff005381),
        body: !apiCall
            ? Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image(image: AssetImage("assets/Vallet.png"), width:  MediaQuery.of(context).size.width * 0.4,),
                      Padding(padding: EdgeInsets.all(10)),
                      Text("PARK ET, ONLINE ÖDE, KOLAY ÇIK!",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.5,
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: codeController,
                        decoration: InputDecoration(
                            hintText: 'SMS KODU',
                            hintStyle: TextStyle(fontSize: 12.0, color: Colors.white),
                            filled: true,
                            fillColor: Color.fromRGBO(185, 207, 221, 1.0),
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            )),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                      Text("Cep telefonuna SMS ile gelen 6 haneli şifreyi gir.",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white), textAlign: TextAlign.center)
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
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
                          _verify(int.parse(codeController.text));
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
          MaterialPageRoute(builder: (context) => StaticNavigationBar()),
        );
      }, onError: (error) {
        setState(() {
          apiCall = false;
        });
      });
    }
  }
}
