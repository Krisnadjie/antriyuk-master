import 'dart:async';

import 'package:flutter/material.dart';
import 'package:antriyuk/welcome1page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Welcome1Page())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xff),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(
                flex: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Image(
                  image: AssetImage('assets/queue.png'),
                  fit: BoxFit.contain,
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                'Antri Yuk',
                style: TextStyle(
                    fontSize: 40,
                    color: Color(0xffdd0303),
                    fontWeight: FontWeight.bold,
                    fontFamily: "OpenSans"),
              ),
              Spacer(
                flex: 10,
              )
            ],
          ),
        ],
      ),
    );
  }
}
