import 'package:etics_app/home/eachRoom.dart';
import 'package:etics_app/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "NunitoLight",
          scaffoldBackgroundColor: Color(0xFF152238)),
      home: Classes(),
    );
  }
}

class Classes extends StatefulWidget {
  @override
  _ClassesState createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //    mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.only(left: 40, top: 50, right: 20),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xFF1C2841), Colors.black],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                   child: IconButton(
                      icon:
                      Icon(Icons.arrow_back, size: 30, color: Color(0xFF40F2E0)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Image.asset("assets/images/person.png",
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.fitWidth),
                        Positioned(
                          left: 130,
                          child: Text(
                            "Keep your eye on!",
                            style: TextStyle(
                                color: Color(0xFFE0FFFF),
                                fontSize: 25,
                                fontFamily: 'NunitoBold'),
                          ),
                        ),
                        Positioned(
                          top: 37,
                          left: 190,
                          child: Text(
                            "Be safe and healthy",
                            style: TextStyle(
                                color: Color(0xFFE0FFFF),
                                fontSize: 15,
                                fontFamily: 'NunitoBold'),
                          ),
                        ),
                        Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                    text: TextSpan(
                        text: "Manage your room",
                        style: const TextStyle(
                            color: Color(0xFFE0FFFF),
                            fontSize: 18,
                            fontFamily: 'NunitoBold'),
                        children: [
                      TextSpan(
                        text: " smartly!",
                        style: const TextStyle(
                            color: Color(0xFF40F2E0),
                            fontSize: 18,
                            fontFamily: 'NunitoBold'),
                      )
                    ])),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                               return eachRoom();
                              },
                            ),
                          );
                        },
                        child:roomCard(
                          image: "assets/images/classroom.png",
                          title: "XII MIPA 1",
                          text: "5",
                        ),
                    ),

                    roomCard(
                      image: "assets/images/graduation.png",
                      title: "Teacher's Office",
                      text: "0",
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    roomCard(
                      image: "assets/images/classroom.png",
                      title: "XII MIPA 2",
                      text: "2",
                    ),
                    roomCard(
                      image: "assets/images/room.png",
                      title: "Front Office",
                      text: "2",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 53),
                Container(
                  padding: EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Color(0xFF40F2E0).withOpacity(.40),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 30,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print('object');
        },
        icon: Icon(Icons.call),
        label: Text(
          '112 Call',
          style: TextStyle(fontSize: 15, fontFamily: 'NunitoBold'),
        ),
        foregroundColor: Color(0xFF050A30),
        backgroundColor: Color(0xFF40F2E0),
      ),
      );

  }
}

class roomCard extends StatelessWidget {
  final String title;
  final String image;
  final String text;
  const roomCard({
    Key key,
    this.title,
    this.text,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFFE0FFFF),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 20,
              color: Colors.black54,
            ),
          ]),
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Color(0xFF050A30).withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.room),
              ),
              SizedBox(width: 5),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Color(0xFF050A30),
                    fontSize: 16,
                    fontFamily: 'NunitoBold'),
              )
            ],
          ),
        ),

        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 17, top: 10, right: 10, bottom: 10),
              child: RichText(
                  text: TextSpan(
                      text: text,
                      style: const TextStyle(
                          color: Color(0xFF050A30),
                          fontSize: 21,
                          fontFamily: 'NunitoBold'),
                      children: [
                    TextSpan(
                      text: " Connected",
                      style: const TextStyle(
                          color: Color(0xFF1C2841),
                          fontSize: 15,
                          fontFamily: 'Nunito'),
                    )
                  ])),
            ),
            Image.asset(image,
                width: 50,
                alignment: Alignment.bottomRight,
                fit: BoxFit.fitWidth),
          ],
        )
      ]),
    );
  }
}
