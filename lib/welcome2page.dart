import 'package:flutter/material.dart';
import 'package:antriyuk/welcome3page.dart';

class Welcome2Page extends StatelessWidget {
  const Welcome2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(
              flex: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.25,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffDC1B1B),
              ),
            ),
            Spacer(
              flex: 5,
            ),
            Text(
              "Dapatkan Kemudahan Akses",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey,
              ),
            ),
            Spacer(
              flex: 10,
            ),
            Row(
              children: <Widget>[
                Spacer(
                  flex: 20,
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffDC1B1B))),
                ),
                Spacer(flex: 1),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffDC1B1B))),
                ),
                Spacer(flex: 1),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffC4C4C4),
                  ),
                ),
                Spacer(
                  flex: 20,
                )
              ],
            ),
            Spacer(
              flex: 2,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffDC1B1B),
                ),
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Welcome3Page())),
                  child: Text("Lanjutkan"),
                  style: ElevatedButton.styleFrom(primary: Color(0xffDC1B1B)),
                )),
            Spacer(
              flex: 4,
            )
          ],
        ),
      ),
    );
  }
}
