import 'package:antriyuk/AmbilAntri.dart';
import 'package:flutter/material.dart';
import 'package:antriyuk/reviewantri.dart';
import 'package:antriyuk/HasilAntri.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class ReviewAntri extends StatefulWidget {
  static TextEditingController nama = TextEditingController();
  static TextEditingController tanggal = TextEditingController();
  static TextEditingController tempat = TextEditingController();
  static TextEditingController layanan = TextEditingController();

  @override
  _ReviewAntriState createState() => _ReviewAntriState();
}

class _ReviewAntriState extends State<ReviewAntri> {
  
  User user  = FirebaseAuth.instance.currentUser!;
  TextEditingController nama = TextEditingController();
  TextEditingController tanggal = TextEditingController();
  TextEditingController tempat = TextEditingController();
  TextEditingController layanan = TextEditingController();
  DateTime? tgl1;
  String iddinas = "";
  String antrian = "";

  void getID() async{
    String dinas = tempat.text;
    final response = await  http.post(Uri.parse("http://10.0.2.2/antriyuk/getId.php"), body: {"dinas":dinas});
    List item = jsonDecode(response.body);
    String n = item[0]['iddinas'];
      setState(() {
        iddinas = n;
        HasilAntri.iddinas = iddinas;
      });
    String tanggal1 = DateFormat("y-MM-d").format(tgl1!);
    getAntri(tempat.text, tanggal1);
  }

  void getAntri (String dinas, String tanggal) async{
    final response = await  http.post(Uri.parse("http://10.0.2.2/antriyuk/getAntri.php"), body: {"dinas":dinas, "tanggal":tanggal});
    List item = jsonDecode(response.body);
    int count = item[0]['antrian'] + 1;
    antrian = iddinas +"-" +count.toString().padLeft(3, '0');
    entriData(tanggal);
  }

  Future entriData(String tanggal1) async{
    final response = await http.post(Uri.parse("http://10.0.2.2/antriyuk/insertAntri.php"),
      body: {"email":user.email,"nama":nama.text,"nomorantri":antrian,"namadinas":tempat.text,"layanan":layanan.text,"tanggal":tanggal1,"status":"Dipesan"});
    setState(() {
      HasilAntri.antrian = antrian;
    });
    lanjut();
  }

  void lanjut(){
    
    Navigator.of(context)
      .pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HasilAntri()), (Route<dynamic> route) => false);
  }


  @override
  void initState() { 
    super.initState();
    nama.text = HasilAntri.nama.text;
    tgl1 = HasilAntri.tanggal!;
    tempat.text = HasilAntri.tempat.text;
    layanan.text = HasilAntri.layanan.text;
    tanggal.text = ReviewAntri.tanggal.text;
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffDC1B1B),
        leading: IconButton(
          onPressed:()=> Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios)),
        title: Text("Review Antrian"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(flex: 2,),          
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: EdgeInsets.only(left: 30),
            child: Text("Nama Tempat", style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),),
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            width: MediaQuery.of(context).size.width * 0.9,
            alignment: Alignment.center,
            child: TextField(
              controller: tempat,
              textAlign: TextAlign.left,
              // controller:,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
              enabled: false,
            )
          ),


          Spacer(flex: 1,),   //////////////////////////Layanan
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: EdgeInsets.only(left: 30),
            child: Text("Layanan", style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),),
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            width: MediaQuery.of(context).size.width * 0.9,
            alignment: Alignment.center,
            child: TextField(
              textAlign: TextAlign.left,
              controller:layanan,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
              enabled: false,
            )
          ),
          Spacer(flex: 1,), //Tanggal
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: EdgeInsets.only(left: 30),
            child: Text("Tanggal", style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),),
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            width: MediaQuery.of(context).size.width * 0.9,
            alignment: Alignment.center,
            child: TextField(
              controller:tanggal,
              textAlign: TextAlign.left,
              // controller:,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
              enabled: false,
            )
          ),

          Spacer(flex: 20,),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: -10,
                  blurRadius: 5,
                  offset: Offset(0, 7), // changes position of shadow
                ),
              ],
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(                
                onPressed: (){
                  getID();
                },
                // ()=> 
                child: Text("LANJUTKAN", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.square(20 * 30),
                  primary: Color(0xffdc1b1b)
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}

