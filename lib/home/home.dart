import 'package:etics_app/home/rooms.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "NunitoLight",
          scaffoldBackgroundColor: Color(0xFF152238)),
      home: Dashboard(),
      /*
      home: Scaffold(
       // resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFF152238),
            ),
          child: Dashboard(),
          ),
        ),
    */
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    double windowHeight = 0;
    double windowWidth = 0;
    double _homeHeight = 0;
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;
    _homeHeight = windowHeight - 270;
    return Scaffold(
      body: Column(
        //    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      alignment: Alignment.topRight,
                      child: Icon(Icons.menu,
                          size: 30, color: Color((0xFF40F2E0)))),
                  SizedBox(height: 20),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Image.asset("assets/images/person2.png",
                            alignment: Alignment.centerLeft,
                            // width: 00.0,
                            //height: 160.0,
                            fit: BoxFit.fitWidth),
                        Positioned(
                          left: 165,
                          child: Text(
                            "Welcome, Natih!",
                            style: TextStyle(
                                color: Color(0xFFE0FFFF),
                                fontSize: 25,
                                fontFamily: 'NunitoBold'),
                          ),
                        ),
                        Positioned(
                          top: 37,
                          left: 200,
                          child: Text(
                            "Keep your safety first.",
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 80),
            //margin: EdgeInsets.symmetric(horizontal: 20),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black54.withOpacity(.40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFE0FFFF),
                    //  color: Color(0xFFE5E5E5),
                  ),
                  child: InkWell(
                    child: Text(
                      "School",
                      style: TextStyle(
                          color: Color(0xFF050A30),
                          fontSize: 20,
                          fontFamily: 'NunitoBold'),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Home();
                          },
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFFE0FFFF),
                  ),
                  child: Material(
                    color: Color(0xFFE0FFFF),
                    child: InkWell(
                      child: Text(
                        "Rooms",
                        style: TextStyle(
                            color: Color(0xFF050A30),
                            fontSize: 20,
                            fontFamily: 'NunitoBold'),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Rooms();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Today's Electricity Usage\n",
                          style: TextStyle(
                              color: Color(0xFFE0FFFF),
                              fontSize: 20,
                              fontFamily: 'NunitoBold'),
                        ),
                        TextSpan(
                          text: "List of connected devices\n",
                          style: TextStyle(
                              color: Color(0xFFE0FFFF),
                              fontSize: 15,
                              fontFamily: 'NunitoLight'),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Rooms();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "See details",
                      style: TextStyle(
                        color: Color(0xFF40F2E0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFE0FFFF),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 30,
                        color: Colors.black,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Counter(
                        color: Color(0xFF050A30),
                        number: 1,
                        title: "CCTV",
                      ),
                      Counter(
                        color: Color(0xFF3A7CA5),
                        number: 3,
                        title: "Lamps",
                      ),
                      Counter(
                        color: Color(0xFF26619C),
                        number: 3,
                        title: "AC",
                      ),
                      Counter(
                        color: Color(0xFF002366),
                        number: 30,
                        title: "Temperature",
                      ),
                    ],
                  )),
            ]),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 40),
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

class Counter extends StatelessWidget {
  final int number;
  final Color color;
  final String title;
  const Counter({
    Key key,
    this.number,
    this.color,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(6),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(.40),
            ),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                    color: color,
                    width: 2,
                  )),
            )),
        SizedBox(height: 10),
        Text(
          "$number",
          style:
              TextStyle(color: color, fontSize: 30, fontFamily: 'NunitoBold'),
        ),
        Text(
          title,
          style:
              TextStyle(color: color, fontSize: 15, fontFamily: 'NunitoLight'),
        )
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
