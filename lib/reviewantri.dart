import 'package:antriyuk/AmbilAntri.dart';
import 'package:flutter/material.dart';
import 'package:antriyuk/reviewantri.dart';
import 'package:antriyuk/HasilAntri.dart';
import 'package:intl/intl.dart';

class ReviewAntri extends StatefulWidget {
  static TextEditingController nm = TextEditingController();
  static TextEditingController tgl = TextEditingController();
  static TextEditingController tmpt = TextEditingController();
  static TextEditingController lyn = TextEditingController();

  @override
  _ReviewAntriState createState() => _ReviewAntriState();
}

class _ReviewAntriState extends State<ReviewAntri> {
  AmbilAntri ambil = new AmbilAntri();
  TextEditingController nama = TextEditingController();
  TextEditingController layanan = TextEditingController();
  TextEditingController tanggal = TextEditingController();
  TextEditingController tempat = TextEditingController();

  @override
  void initState() { 
    super.initState();
    nama.text = ReviewAntri.nm.text;
    layanan.text = ReviewAntri.lyn.text;
    tanggal.text = ReviewAntri.tgl.text;
    tempat.text = ReviewAntri.tmpt.text;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffDC1B1B),
        leading: IconButton(
          onPressed:()=> Navigator.pop(context),
          icon: Icon(Icons.arrow_back)),
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
                onPressed: (){},
                // ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>HasilAntri())),
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

