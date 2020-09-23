import 'package:flutter/material.dart';

class WideButton extends StatefulWidget {
  final Function() onTap;
  final String buttonText;
  final bool disable;
  final bool progress;
  final bool outline;

  WideButton({
    this.buttonText,
    this.onTap,
    this.disable = false,
    this.progress = false,
    this.outline = false,
  });

  @override
  _WideButtonState createState() => _WideButtonState();
}

class _WideButtonState extends State<WideButton> {
  @override
  Widget build(BuildContext context) {
    Color color = Colors.cyan;
    Color borderColor = Colors.cyan;
    Color contentColor = Colors.white;
    if (widget.outline) {
      color = null;
      if (widget.disable) {
        contentColor = Colors.grey;
        borderColor = Colors.grey;
      } else {
        contentColor = Colors.cyan;
      }
    } else if (widget.disable) {
      color = Colors.grey;
      borderColor = Colors.grey;
    }

    List<BoxShadow> boxShadows = [];
    if (!widget.outline) {
      boxShadows.add(
        BoxShadow(
          color: Colors.black26,
          blurRadius: 6.0,
          offset: Offset(0, 2)
        )
      );
    }

    return GestureDetector(
        onTap: () {
          if (!widget.disable) {
            widget.onTap();
          }
        },
        child: AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          height: 60,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: boxShadows,
          ),
          child: Center(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: (widget.progress)
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(contentColor),
                      ),
                    )
                  : Text(widget.buttonText,
                      style: TextStyle(
                        color: contentColor,
                        fontSize: 16,
                        fontFamily: 'NunitoBold',
                      ),
                    ),
            ),
          )
        ));
  }
}