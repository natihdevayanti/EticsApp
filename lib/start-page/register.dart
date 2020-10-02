import 'package:etics_app/start-page/start_page.dart';
import 'package:etics_app/widgets/wide_text_field.dart';
import 'package:etics_app/widgets/wide_button.dart';
import 'package:etics_app/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_size/screen_height.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _signingUp = false;

  double _yOffset = 0;
  double _height = 0;

  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;

    return Consumer2<StartPageModel, ScreenHeight>(
        builder: (context, startPage, screenHeight, child) {
          switch (startPage.state) {
            case StartPageState.None:
            case StartPageState.Login:
              _yOffset = windowHeight;
              _height = 440;
              break;

            case StartPageState.Register:
              _yOffset = screenHeight.isOpen
                ? windowHeight - 240 - screenHeight.keyboardHeight
                : windowHeight - 440;
              _height = screenHeight.isOpen
                ? screenHeight.keyboardHeight + 240
                : 440;
              break;
          }

          List<Widget> widgets = [
            AnimatedContainer(
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
                  createInputAndTitle(),
                  createButtons(),
                ],
              )
            ),
          ];

          if (startPage.state == StartPageState.Register) {
            widgets.insert(0, createBackLayer());
          }

          return Stack(children: widgets);
        });
  }

  Widget createBackLayer() {
    return Consumer2<StartPageModel, ScreenHeight>(
      builder: (context, startPage, screenHeight, child) {
        return WillPopScope(
          onWillPop: () async {
            if (startPage.state == StartPageState.Register) {
              startPage.state = StartPageState.Login;
              return false;
            }

            return true;
          },
          child: GestureDetector(
            onTap: () {
              if (screenHeight.isOpen) {
                FocusScope.of(context).unfocus();
              } else {
                startPage.state = StartPageState.Login;
              }
            },
            child: Container(
              color: Colors.transparent,
              width: double.maxFinite,
              height: double.maxFinite,
            ),
          ),
        );
      }
    );
  }

  Widget createInputAndTitle() {
    return Column(
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
        WideTextField(
          icon: Icons.email,
          hint: "Your email",
          controller: _emailController,
          disable: _signingUp,
        ),
        SizedBox(
          height: 15,
        ),
        WideTextField(
          icon: Icons.lock,
          hint: "Password",
          obscureText: true,
          controller: _passwordController,
          disable: _signingUp,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget createButtons() {
    return Column(
      children: <Widget>[
        WideButton(
          text: "Sign Up",
          onTap: () {
            setState(() => _signingUp = true);
            var authentication = Provider.of<AuthenticationModel>(context, listen: false);
            authentication.signUp(email: _emailController.text.trim(),
                password: _passwordController.text.trim())
              .then((_) => setState(() => _signingUp = false))
              .catchError((err) {
                setState(() => _signingUp = false);
                print("Sign in error " + err.toString());
              });
          },
          disable: _signingUp,
          progress: _signingUp,
        ),
        SizedBox(
          height: 10,
        ),
        WideButton(
          text: "Back To Login",
          onTap: () {
            var startPage = Provider.of<StartPageModel>(context, listen: false);
            startPage.state = StartPageState.Login;
          },
          outline: true,
          disable: _signingUp,
        )
      ],
    );
  }
}