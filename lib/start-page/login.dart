import 'package:etics_app/authentication.dart';
import 'package:etics_app/start-page/start_page.dart';
import 'package:etics_app/widgets/wide_text_field.dart';
import 'package:etics_app/widgets/wide_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:flutter_keyboard_size/screen_height.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _signingIn = false;

  double _opacity = 1;
  double _xOffset = 0;
  double _yOffset = 0;
  double _width = 0;
  double _height = 0;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return Consumer2<StartPageModel, ScreenHeight>(
        builder: (context, startPage, screenHeight, child) {
          switch (startPage.state) {
            case StartPageState.None:
              _opacity = 1;
              _xOffset = 0;
              _yOffset = windowHeight;
              _width = windowWidth;
              _height = screenHeight.isOpen
                  ? screenHeight.keyboardHeight + 225
                  : 450;
              break;

            case StartPageState.Login:
              _opacity = 1;
              _xOffset = 0;
              _yOffset = screenHeight.isOpen
                  ? windowHeight - 225 - screenHeight.keyboardHeight
                  : windowHeight - 450;
              _width = windowWidth;
              _height = screenHeight.isOpen
                  ? screenHeight.keyboardHeight + 225
                  : 450;
              break;

            case StartPageState.Register:
              _opacity = 0.7;
              _xOffset = 20;
              _yOffset = screenHeight.isOpen
                  ? windowHeight - 260 - screenHeight.keyboardHeight
                  : windowHeight - 460;
              _width = windowWidth - 40;
              _height = screenHeight.isOpen
                  ? screenHeight.keyboardHeight + 260
                  : 460;
              break;
          }

          List<Widget> widgets = [
            AnimatedContainer(
              padding: EdgeInsets.all(20),
              width: _width,
              height: _height,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1000),
              transform: Matrix4.translationValues(_xOffset, _yOffset, 1),
              decoration: BoxDecoration(
                  color: Color(0xFFE0FFFF).withOpacity(_opacity),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30), topRight: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  createInputAndTitle(),
                  createButtons(),
                ],
              ),
            ),
          ];

          if (startPage.state == StartPageState.Login) {
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
            if (startPage.state == StartPageState.Login) {
              if (!_signingIn) {
                startPage.state = StartPageState.None;
              }

              return false;
            }

            return true;
          },
          child: GestureDetector(
            onTap: () {
              if (screenHeight.isOpen) {
                FocusScope.of(context).unfocus();
              } else if (!_signingIn) {
                startPage.state = StartPageState.None;
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
            "Sign in to Continue",
            style: TextStyle(
                color: Color(0xFF050A30),
                fontSize: 20,
                fontFamily: 'NunitoBold'),
          ),
        ),
        WideTextField(
          icon: Icons.email,
          hint: "Your email",
          controller: _emailController,
          disable: _signingIn,
        ),
        SizedBox(
          height: 15,
        ),
        WideTextField(
          icon: Icons.lock,
          hint: "Your password",
          controller: _passwordController,
          obscureText: true,
          disable: _signingIn,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () =>
                    print('Forgot Password Button Pressed'),
                padding: EdgeInsets.only(right: 0.0),
                child: Text('Forgot Password?',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 13,
                        fontFamily: 'NunitoBold')),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget createButtons() {
    return Column(
      children: <Widget>[
        WideButton(
          text: "Sign In",
          onTap: () {
            setState(() => _signingIn = true);
            var authentication = Provider.of<AuthenticationModel>(context, listen: false);
            authentication.signIn(email: _emailController.text.trim(),
                password: _passwordController.text.trim())
              .then((_) => setState(() => _signingIn = false))
              .catchError((err) {
                setState(() => _signingIn = false);
                print("Sign in error " + err.toString());
              });
          },
          disable: _signingIn,
          progress: _signingIn,
        ),
        SizedBox(
          height: 10,
        ),
        WideButton(
          onTap: () {
            var startPage = Provider.of<StartPageModel>(context, listen: false);
            startPage.state = StartPageState.Register;
          },
          text: "Create New Account",
          outline: true,
          disable: _signingIn,
        ),
      ],
    );
  }
}