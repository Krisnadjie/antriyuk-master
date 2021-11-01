import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HalHome extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.topCenter,
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                color: Color(0xffDC1B1B),
                borderRadius: BorderRadius.vertical(
                  bottom:
                      Radius.elliptical(MediaQuery.of(context).size.width, 100),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.115,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Spacer(
                      flex: 1,
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(user.photoURL!),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      user.displayName!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(
                      flex: 10000,
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(                    
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: EdgeInsets.all(100),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(                    
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: EdgeInsets.all(100),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(                    
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: EdgeInsets.all(100),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 8),
          ],
        )
      ],
    ));
  }
}
