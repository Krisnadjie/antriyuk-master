import 'dart:convert';
import 'package:antriyuk/Aktivitas.dart';
import 'package:antriyuk/detailAntrian.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;

class HasilAntri extends StatefulWidget {
  static TextEditingController nama = TextEditingController();
  static TextEditingController tempat = TextEditingController();
  static TextEditingController layanan = TextEditingController();
  static DateTime? tanggal;
  static String antrian = "";
  static String iddinas = "";

  @override
  _HasilAntriState createState() => _HasilAntriState();
}

class _HasilAntriState extends State<HasilAntri> {
  
  User user  = FirebaseAuth.instance.currentUser!;
  TextEditingController nama = TextEditingController();
  DateTime? tanggal;
  TextEditingController tempat = TextEditingController();
  TextEditingController layanan = TextEditingController();
  String iddinas = "";
  String antrian = "";

  void lihatDetail(){
    setState(() {
      DetailAntrian.nama.text= nama.text;
      DetailAntrian.tanggal = tanggal!;
      DetailAntrian.tempat.text = tempat.text;
      DetailAntrian.layanan.text = layanan.text;
      DetailAntrian.nomorAntrian.text = antrian;
    });
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DetailAntrian()));
  }

  @override
  void initState() { 
    super.initState();
    setState(() {
      nama.text = HasilAntri.nama.text;
      tanggal = HasilAntri.tanggal;
      tempat.text = HasilAntri.tempat.text;
      layanan.text = HasilAntri.layanan.text;
      antrian = HasilAntri.antrian;
      iddinas = HasilAntri.iddinas;  
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color(0xffDC1B1B),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AktivitasSaya()));
            }, icon: Icon(Icons.close))
        ],
        title: Text("Berhasil"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 2,),
            Text(
              "Nomor antrian anda di",
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            Text(
              tempat.text,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 28,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold
              ),  
            ),
            Text(
              layanan.text,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 26,
                fontFamily: 'Roboto',
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width *0.5,
              height: MediaQuery.of(context).size.height *0.3,
              padding: EdgeInsets.all(40),
              child: Container(
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.1),
                  backgroundImage: NetworkImage(user.photoURL!),),
              ),
            ),
            Text(
              nama.text,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 26,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              antrian,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 26,
                fontFamily: 'Roboto',
              ),
            ),
            Spacer(flex: 1,),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
              width: MediaQuery.of(context).size.width*0.65,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: -20,
                    blurRadius: 5,
                    offset: Offset(0, 10), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10)
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.05,
                child: ElevatedButton(                
                  onPressed: ()=>lihatDetail(),
                  child: Text("LIHAT DETAIL", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)
                    ),
                    fixedSize: Size.square(20 * 30),
                    primary: Color(0xffdc1b1b)
                  ),
                ),
              ),
            ),
            Spacer(flex: 2,)
          ],
        ),
      ),
    );
  }
}