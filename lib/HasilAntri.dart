import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HasilAntri extends StatefulWidget {
  static TextEditingController nm = TextEditingController();
  static TextEditingController tmpt = TextEditingController();
  static TextEditingController lyn = TextEditingController();
  static DateTime? tgl;

  @override
  _HasilAntriState createState() => _HasilAntriState();
}

class _HasilAntriState extends State<HasilAntri> {
  
  TextEditingController nm = TextEditingController();
  DateTime? tgl;
  TextEditingController tmpt = TextEditingController();
  TextEditingController lyn = TextEditingController();
  String iddinas = "";
  String antrian = "";

  void getID(String dinas) async{
    final response = await  http.post(Uri.parse("http://10.0.2.2/antriyuk/getId.php"), body: {"dinas":dinas});
    List item = jsonDecode(response.body);
    for(int i =0; i<item.length; i++){
      String n = item[i]['iddinas'];
      setState(() {
        iddinas = n;
      });
    }
    String tanggal = DateFormat("y-MM-d").format(tgl!);
    getAntri(dinas, tanggal);
  }

  void getAntri (String dinas, String tanggal) async{
    final response = await  http.post(Uri.parse("http://10.0.2.2/antriyuk/getAntri.php"), body: {"dinas":dinas, "tanggal":tanggal});
    List item = jsonDecode(response.body);
    int count = item[0]['antrian'] + 1;
    antrian = iddinas +count.toString().padLeft(3, '0');
    print(antrian);
  }


  @override
  void initState() { 
    super.initState();
    nm.text = HasilAntri.nm.text;
    // tgl = HasilAntri.tgl;
    tmpt.text = HasilAntri.tmpt.text;
    lyn.text = HasilAntri.lyn.text;

    getID("DUKCAPIL");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color(0xffDC1B1B),
        actions: <Widget>[
          IconButton(
            onPressed: (){}, icon: Icon(Icons.close))
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
              "Dinas Kesehatan",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 28,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold
              ),  
            ),
            Text(
              "General CheckUp",
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
                  backgroundColor: Color(0xffdc1b1b),
                  child: Icon(Icons.person, size: 100,),),
              ),
            ),
            Text(
              "Bambang",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 26,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              "A-001",
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
                  onPressed: (){},
                  // ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>HasilAntri())),
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