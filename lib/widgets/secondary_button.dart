
import 'package:flutter/material.dart';

class SecondaryButton extends StatefulWidget {
  final String buttonText;
  SecondaryButton({this.buttonText});
  @override
  _SecondaryButtonState createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF40F2E0), width: 2),
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(widget.buttonText,
              style: TextStyle(
                  color: Color(0xFF40F2E0),
                  fontSize: 16,
                  fontFamily: 'NunitoBold')),
        ));
  }
}