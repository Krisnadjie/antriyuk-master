import 'package:antriyuk/homepage.dart';
import 'package:flutter/material.dart';
 import 'package:antriyuk/Aktivitas.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AktivitasSelesai extends StatefulWidget {
  const AktivitasSelesai({ Key? key }) : super(key: key);

  @override
  _AktivitasSelesaiState createState() => _AktivitasSelesaiState();
}

class _AktivitasSelesaiState extends State<AktivitasSelesai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffDC1B1B),
        title: Text("Aktivitas Saya"),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            width : MediaQuery.of(context).size.width,
            height : MediaQuery.of(context).size.width *0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width : MediaQuery.of(context).size.width *0.5,
                  height : MediaQuery.of(context).size.width *0.1,
                  color: Color(0xffdc1b1b),
                  child: TextButton(
                    child: Text(
                      "Antrian",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: (){
                      Navigator.pushReplacement(
                        context, 
                        PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) => AktivitasSaya(),
                            transitionDuration: Duration.zero,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width : MediaQuery.of(context).size.width *0.5,
                  height : MediaQuery.of(context).size.width *0.092,
                  color: Color(0xffdc1b1b),
                  child: TextButton(
                    child: Text(
                      "Selesai",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    ),
                    onPressed: (){},),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.7315,
            // color: Colors.red,
            child: Selesai()
          ),
          BarNavigasi2()
        ],
      ),
    );
  }
}


class Selesai extends StatefulWidget {
  const Selesai({ Key? key }) : super(key: key);

  @override
  _SelesaiState createState() => _SelesaiState();
}

class _SelesaiState extends State<Selesai> {
  List list =[
    {"antrian":"A-001",
      "nama": "Bambang",
      "tempat": "Dinas Kesehatan",
      "layanan": "General CheckUp",
      "tanggal" :"2021-11-30"
      },
      {"antrian":"A-002",
      "nama": "Bambang",
      "tempat": "Dinas Kesehatan",
      "layanan": "General CheckUp",
      "tanggal" :"2021-11-30"
      },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context,index){
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.3,
            padding: EdgeInsets.only(top:20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
               boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(1, 10), // changes position of shadow
                  ),
                ],
            ),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  // color: Colors.white,
                  alignment: Alignment.topCenter,
                  child: Icon(Icons.task_alt,color: Color(0xff2BC48A),),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Antrian telah selesai",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontFamily: 'Roboto Medium'
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Nomor Antrian",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    Text(
                      list[index]['antrian'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Nama Lengkap",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    Text(
                      list[index]['nama'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Nama Tempat",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    Text(
                      list[index]['tempat'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Nama Layanan",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    Text(
                      list[index]['layanan'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    SizedBox(height: 3),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.calendarAlt,color: Color(0xff68686A),),
                        SizedBox(width:5),
                        Text(
                          list[index]['tanggal'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Roboto'
                          ),
                        )
                      ],
                    ),
                   
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
