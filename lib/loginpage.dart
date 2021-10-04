import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:antriyuk/welcomepage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  DateTime timepressed = DateTime.now();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<User?> _signIn() async {
    final GoogleSignInAccount? account = await googleSignIn.signIn();
    final GoogleSignInAuthentication authentication =
        await account!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        final diff = DateTime.now().difference(timepressed);
        final exit = diff >= Duration(seconds: 2);

        timepressed = DateTime.now();

        if (exit) {
          final message = "Tekan tombol kembali lagi untuk keluar";
          Fluttertoast.showToast(msg: message, fontSize: 18);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
          body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // color: Color(0xffdc1b1b),
          ),
          Column(children: <Widget>[
            Spacer(flex: 20),
            Text('Login With Google'),
            Spacer(
              flex: 1,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white60,
                    padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => _signIn(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Spacer(),
                      Icon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                      Spacer(),
                      Text(
                        'Login with Google',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Spacer()
                    ],
                  )),
            ),
            Spacer(
              flex: 20,
            )
          ]),
        ],
      )),
    );
  }
}
