import 'package:flutter/material.dart';
import 'loginpage.dart';

class Welcome3Page extends StatelessWidget {
  const Welcome3Page({Key? key}) : super(key: key);

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
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffDC1B1B),
              ),
              child: FractionallySizedBox(
                  widthFactor: 0.4,
                  heightFactor: 0.7,
                  child: Image.asset('assets/Welcome3.png')),
            ),
            Spacer(
              flex: 5,
            ),
            Text(
              "Sesuaikan Jadwal Anda",
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
                      border: Border.all(color: Color(0xffDC1B1B))),
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
                  onPressed: () => 
                  Navigator.of(context)
                    .pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage()), (Route<dynamic> route) => false),
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
