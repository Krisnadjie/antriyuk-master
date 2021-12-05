import 'package:antriyuk/Selesai.dart';
import './Akun.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './homepage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AktivitasSaya extends StatefulWidget {

  @override
  _AktivitasSayaState createState() => _AktivitasSayaState();
}

class _AktivitasSayaState extends State<AktivitasSaya> {
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
                  height : MediaQuery.of(context).size.width *0.092,
                  color: Color(0xffdc1b1b),
                  child: TextButton(
                    child: Text(
                      "Antrian",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    onPressed: (){},
                  ),
                ),
                Container(
                  width : MediaQuery.of(context).size.width *0.5,
                  height : MediaQuery.of(context).size.width *0.1,
                  color: Color(0xffdc1b1b),
                  child: TextButton(
                    child: Text(
                      "Selesai",
                      style: TextStyle(
                        color: Colors.white,

                      ),
                    ),
                    onPressed: (){
                      Navigator.pushReplacement(
                      context, 
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) => AktivitasSelesai(),
                        transitionDuration: Duration.zero,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.7315,
            // color: Colors.red,
            child: Antrian()
          ),
          BarNavigasi2()
        ],
      ),
    );
  }
}

class Antrian extends StatefulWidget {

  @override
  _AntrianState createState() => _AntrianState();
}

class _AntrianState extends State<Antrian> {
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
  void initState() { 
    super.initState();
    
  }


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
            height: MediaQuery.of(context).size.height * 0.35,
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
                  child: Icon(Icons.access_time,color: Colors.red,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Antrian telah dipesan",
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width:  MediaQuery.of(context).size.width * 0.5,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white.withOpacity(0.2),
                              shadowColor: Colors.white.withOpacity(0.2)
                            ),
                            onPressed: (){},
                            child: Row(
                              children: [
                                Text(
                                  "Lihat Detail",
                                  style: TextStyle(
                                    color: Color(0xffdc1b1b),
                                    fontWeight: FontWeight.bold,                        
                                  ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Color(0xffdc1b1b),
                                    size: 20,
                                    )
                              ],
                            ),
                          ),
                          )
                      ],
                    )
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


class BarNavigasi2 extends StatefulWidget {
  const BarNavigasi2({ Key? key }) : super(key: key);

  @override
  _BarNavigasi2State createState() => _BarNavigasi2State();
}

class _BarNavigasi2State extends State<BarNavigasi2> {
  @override
  Widget build(BuildContext context) {
    return Container(      
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.091,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height *0.091,
            child: ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => HalHome(),
                      transitionDuration: Duration.zero,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 30,
                    child: Icon(
                      FontAwesomeIcons.home,
                      size: 30,
                      color: Color(0xff6E6E6E),
                    ),),
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff6E6E6E)
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),        
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height *0.091,
            // color: Colors.green,            
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 30,                  
                    child: Icon(
                      Icons.list_alt,
                      size: 36,
                      color: Color(0xffcd1b1b),
                    ),),
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "Antrian",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffcd1b1b),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),          
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height *0.091,
            // color: Colors.green,            
            child: ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => Akun(),
                      transitionDuration: Duration.zero,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 30,                                      
                    child: Icon(
                      FontAwesomeIcons.user,
                      size: 30,
                      color: Color(0xff6E6E6E),                    
                    ),),                
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff6E6E6E)
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}