import 'package:etics_app/start-page/start_page.dart';
import 'package:etics_app/widgets/input_with_icon.dart';
import 'package:etics_app/widgets/input_with_icon_pass.dart';
import 'package:etics_app/widgets/primary_button.dart';
import 'package:etics_app/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:provider/provider.dart';

import '../dashboard.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _keyboardVisible = false;
  double _yOffset = 0;
  double _height = 0;

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
        onChange: (bool visible) {
          _keyboardVisible = visible;
        });
  }

  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;

    return Consumer<StartPageModel>(
        builder: (context, startPage, child) {
          switch (startPage.state) {
            case StartPageState.None:
            case StartPageState.Login:
              _yOffset = windowHeight;
              _height = windowHeight - 270;
              break;

            case StartPageState.Register:
              _yOffset = _keyboardVisible ? 170 : 270;
              _height = _keyboardVisible ? windowHeight : windowHeight - 260;
              break;
          }

          return AnimatedContainer(
              height: _height,
              padding: EdgeInsets.all(32),
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1000),
              transform: Matrix4.translationValues(0, _yOffset, 1),
              decoration: BoxDecoration(
                  color: Color(0xFFE0FFFF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30), topRight: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF050A30),
                              fontFamily: 'NunitoBold'),
                        ),
                      ),
                      InputWithIcon(
                        icon: Icons.email,
                        hint: "Your email",
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InputWithIconPass(
                        icon: Icons.lock,
                        hint: "Password",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Dashboard();
                              },
                            ),
                          );
                        },
                        child: PrimaryButton(
                          buttonText: "SIGN UP",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          startPage.state = StartPageState.Login;
                        },
                        child: SecondaryButton(
                          buttonText: "BACK TO LOGIN",
                        ),
                      )
                    ],
                  ),
                ],
              ));
        });
  }
}