import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: 100),
        child: Center(
          child: Text(
            "This is dashboard",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'NunitoLight'),
          ),
        ));
  }
}