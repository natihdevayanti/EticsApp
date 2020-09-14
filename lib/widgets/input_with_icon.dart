import 'package:flutter/material.dart';

class InputWithIcon extends StatefulWidget {
  final IconData icon;
  final String hint;
  InputWithIcon({this.icon, this.hint});
  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFBB9B9B9), width: 2),
            borderRadius: BorderRadius.circular(50)),
        child: Row(
          children: <Widget>[
            Container(
                width: 80,
                child: Icon(widget.icon, size: 20, color: Color((0xFF40F2E0)))),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    border: InputBorder.none,
                    hintText: widget.hint),
              ),
            )
          ],
        ));
  }
}