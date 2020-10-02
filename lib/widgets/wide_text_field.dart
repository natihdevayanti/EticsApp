import 'package:flutter/material.dart';

class WideTextField extends StatefulWidget {
  final IconData icon;
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final bool disable;

  WideTextField({
    this.icon,
    this.hint,
    this.controller,
    this.obscureText = false,
    this.disable = false,
  });

  @override
  _WideTextFieldState createState() => _WideTextFieldState();
}

class _WideTextFieldState extends State<WideTextField> {

  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: _focused ? Colors.cyan : Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(50)),
        child: Row(
          children: <Widget>[
            Container(
                width: 80,
                child: Icon(widget.icon,
                  color: widget.disable ? Colors.grey : Colors.cyan,
                  size: 20,
                )),
            Expanded(
              // child: FocusScope(
                child: Focus(
                  onFocusChange: (focus) {
                    setState(() {
                      _focused = focus;
                    });
                  },
                  child: TextField(
                    enabled: !widget.disable,
                    obscureText: widget.obscureText,
                    controller: widget.controller,
                    style: TextStyle(
                      color: widget.disable ? Colors.grey : Colors.black,
                    ),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        border: InputBorder.none,
                        hintText: widget.hint),
                  ),
                ),
              // ),
            ),
          ],
        ));
  }
}