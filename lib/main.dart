// ignore_for_file: unused_element

import 'dart:async';
import 'package:antriyuk/Aktivitas.dart';
import 'package:antriyuk/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:antriyuk/welcomepage.dart';
import 'package:antriyuk/loginpage.dart';
import 'package:antriyuk/homepage.dart';
import './Selesai.dart';
import 'Akun.dart';

                                                          
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: routePage() ,
    );
  }
}

class routePage extends StatefulWidget
{
  @override
  routePageState createState() => routePageState();
}

class routePageState extends State<routePage>
{
  final User _auth = FirebaseAuth.instance.currentUser!;
  bool isLoggedin = false;
  @override
  void initState() {
    super.initState();
    if (_auth != null){
      setState(() {
        isLoggedin = true;
      });
    }
    else{
      setState(() {
        isLoggedin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedin==true ? HalHome() : LoginPage();
    // return Akun();
  }

}