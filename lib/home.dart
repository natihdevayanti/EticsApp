import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "NunitoLight"),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       // resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
       //  child: Dashboard(),
        ),
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
    return Container();
  }
}

//AnimatedContainer(
//height: _registerHeight,
//padding: EdgeInsets.all(32),
//curve: Curves.fastLinearToSlowEaseIn,
//duration: Duration(milliseconds: 1000),
//transform: Matrix4.translationValues(0, _registerYOffset, 1),
//decoration: BoxDecoration(
//color: Color(0xFFE0FFFF),
//borderRadius: BorderRadius.only(
//topLeft: Radius.circular(30), topRight: Radius.circular(30))),