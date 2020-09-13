import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String buttonText;
  PrimaryButton({this.buttonText});
  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFF40F2E0),
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(widget.buttonText,
              style: TextStyle(
                  color: Color(0xFFE0FFFF),
                  fontSize: 16,
                  fontFamily: 'NunitoBold')),
        ));
  }
}