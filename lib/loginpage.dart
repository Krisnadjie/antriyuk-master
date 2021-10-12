import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
    return Scaffold(
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
          Spacer(
            flex: 4,
          ),
          Row(
            children: <Widget>[
              Spacer(
                flex: 2,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.width * 0.1,
                  child: Image(image: AssetImage('assets/queue.png'))),
              Spacer(
                flex: 1,
              ),
              Text(
                "Antri Yuk",
                style: TextStyle(
                    color: Color(0xff485167),
                    fontSize: 32,
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 20,
              )
            ],
          ),
          Spacer(flex: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            alignment: Alignment.center,
            child: Image(
              image: AssetImage("assets/Login.png"),
              fit: BoxFit.contain,
            ),
          ),
          Spacer(
            flex: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffffffff),
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Color(0xffEB4335))),
                ),
                onPressed: () => _signIn(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(
                      flex: 4,
                    ),
                    Icon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      'Masuk dengan Google',
                      style: TextStyle(
                        color: Color(0xffEB4335),
                        fontSize: 20,
                      ),
                    ),
                    Spacer(
                      flex: 4,
                    )
                  ],
                )),
          ),
          Spacer(
            flex: 2,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              "Dengan masuk atau mendaftar, anda menyetujui Ketentuan Layanan dan Kebijakan Privasi.",
              style: TextStyle(fontSize: 14),
            ),
          ),
          Spacer(
            flex: 2,
          )
        ]),
      ],
    ));
  }
}
