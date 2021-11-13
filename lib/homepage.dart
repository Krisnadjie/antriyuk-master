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
                      flex: 10,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(user.photoURL!),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    Text(
                      user.displayName!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,                      
                      ),
                    ),
                    Spacer(
                      flex: 200,
                    )
                  ],
                ),
              ),
            ),
            Container(              
              padding: EdgeInsets.only(top: 15, left: 10, right: 10),
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(                
                borderRadius: BorderRadius.circular(20)
              ),
              child: WidgetNews(),
            ),            
            Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              alignment: Alignment.centerLeft,
              height: 30,
              child: Text("Pilih Tempat Layanan yang dituju", style: TextStyle(
                fontSize: 16,
                fontFamily: "Roboto Bold"
              ),),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, left: 10, right: 10),
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(   
                color: Colors.white,                             
              ),
              child: DinasWidget(),
            ),
            Spacer(flex: 8),
          ],
        )
      ],
    ));
  }
}


////////////////////////////////////////// widget News //////////////////////////////////////////
class WidgetNews extends StatefulWidget {
  const WidgetNews({ Key? key }) : super(key: key);

  @override
  _WidgetNewsState createState() => _WidgetNewsState();
}

class _WidgetNewsState extends State<WidgetNews> {
  List<NewsList> listnews= [
    NewsList(news: 'Sekarang antri menjadi lebih mudah dengan AntriYuk', image: 'assets/queue.png'),
    NewsList(news: 'Sekarang antri menjadi lebih mudah dengan AntriYuk', image: 'assets/queue.png'),
    NewsList(news: 'Sekarang antri menjadi lebih mudah dengan AntriYuk', image: 'assets/queue.png'),
    NewsList(news: 'Sekarang antri menjadi lebih mudah dengan AntriYuk', image: 'assets/queue.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      scrollDirection: Axis.horizontal,
      itemCount: listnews.length,
      itemBuilder: (context, index){
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff9D9D9D),
              borderRadius: BorderRadius.circular(10)
            ),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.12,
                  child: Image(
                    image: AssetImage(listnews[index].image),
                    fit: BoxFit.fill,),
                ),
                Text(listnews[index].news, textAlign: TextAlign.center,),
              ],
            )
          ),
        
        );
      }
      
      );
  }
}


////////////////////////////////////////// News List Class //////////////////////////////////////////
class NewsList{
  String news ;
  String image ;

  NewsList({required this.news, required this.image});
}


////////////////////////////////////////// Dinas List Class //////////////////////////////////////////
class DinasList{
  String nama;
  String logo;

  DinasList({required this.nama, required this.logo});
}


////////////////////////////////////////// Widget List Dinas //////////////////////////////////////////
class DinasWidget extends StatefulWidget {
  const DinasWidget({ Key? key }) : super(key: key);

  @override
  _DinasWidgetState createState() => _DinasWidgetState();
}

class _DinasWidgetState extends State<DinasWidget> {
  List<DinasList> listDinas = [
    DinasList(nama: 'Dinas Kesehatan', logo: 'assets/logo/diskes.png'),
    DinasList(nama: 'Dinas Kesehatan', logo: 'assets/logo/diskes.png'),
    DinasList(nama: 'Dinas Kesehatan', logo: 'assets/logo/diskes.png'),
    DinasList(nama: 'Dinas Kesehatan', logo: 'assets/logo/diskes.png'),
    DinasList(nama: 'Dinas Kesehatan', logo: 'assets/logo/diskes.png'),
    DinasList(nama: 'Dinas Kesehatan', logo: 'assets/logo/diskes.png'),
    DinasList(nama: 'Dinas Kesehatan', logo: 'assets/logo/diskes.png'),
    DinasList(nama: 'Dinas Kesehatan', logo: 'assets/logo/diskes.png'),
    DinasList(nama: 'Dinas Kesehatan', logo: 'assets/logo/diskes.png'),
    DinasList(nama: 'Dinas Kesehatan', logo: 'assets/logo/diskes.png'),
    DinasList(nama: 'Dinas Kesehatan', logo: 'assets/logo/diskes.png'),
    DinasList(nama: 'Dinas Kesehatan', logo: 'assets/logo/diskes.png'),
    DinasList(nama: 'Dinas Kesehatan', logo: 'assets/logo/diskes.png'),
    DinasList(nama: 'Dinas Kesehatan', logo: 'assets/logo/diskes.png'),
    DinasList(nama: 'Dinas Kesehatan', logo: 'assets/logo/diskes.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      scrollDirection: Axis.vertical,
      children: List.generate(listDinas.length, (index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(          
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width *0.2,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image(
                    image: AssetImage(listDinas[index].logo),
                    fit: BoxFit.fill,),
                ),
                Spacer(),
                Text(
                  listDinas[index].nama,
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: "Roboto Medium"
                  ),),
                
              ],
            ),
          ),
        );
      }
      ),
    );
  }
}
