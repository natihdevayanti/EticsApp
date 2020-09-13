
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import '../widgets/input-with-icon-pass.dart';
import '../widgets/input-with-icon.dart';
import '../widgets/secondary-button.dart';
import '../widgets/primary-button.dart';
import '../dashboard.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _pageState = 0;

  var _backgroundColor = Colors.black12;
  var _headingColor = Color(0xFFE0FFFF);

  double _headingTop = 200;

  double _loginWidth = 0;
  double _loginOpacity = 1;
  double _loginHeight = 0;
  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;
  double _registerHeight = 0;
  double windowWidth = 0;
  double windowHeight = 0;
  bool _keyboardVisible = false;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    _loginHeight = windowHeight - 270;
    _registerHeight = windowHeight - 270;

    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.black12;
        _headingColor = Color(0xFFE0FFFF);
        _headingTop = 322;
        _loginWidth = 0;
        _loginOpacity = 1;
        _loginYOffset = windowHeight;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;

      //login page
      case 1:
        _backgroundColor = Colors.black54;
        _headingColor = Color(0xFFE0FFFF);
        _headingTop = 0;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _loginYOffset = _keyboardVisible ? 170 : 250;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 240;
        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;

      //register page
      case 2:
        _backgroundColor = Colors.black54;
        _headingColor = Color(0xFFE0FFFF);
        _headingTop = 0;
        _loginWidth = windowWidth - 35;
        _loginOpacity = 0.7;
        _loginYOffset = _keyboardVisible ? 150 : 247;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 247;
        _loginXOffset = 20;
        _registerYOffset = _keyboardVisible ? 170 : 270;
        _registerHeight = _keyboardVisible ? windowHeight : windowHeight - 260;
        break;
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: <Widget>[
          AnimatedContainer(
            color: _backgroundColor,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _pageState = 0;
                      print(_pageState);
                    });
                  },
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(milliseconds: 1000),
                          margin: EdgeInsets.only(top: _headingTop),
                          child: Text(
                            "ETICS",
                            style: TextStyle(
                                color: _headingColor,
                                fontSize: 60,
                                fontFamily: 'NunitoExtraBold'),
                          ),
                        ),
                        new Container(
                          margin: EdgeInsets.only(left: 150, right: 150),
                          height: 10,
                          color: _headingColor,
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.symmetric(horizontal: 100),
                          child: Text(
                            "Keeping you and your beloved ones safe.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: _headingColor,
                                fontSize: 17,
                                fontFamily: 'NunitoLight'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  //wrapper
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_pageState != 0) {
                          _pageState = 0;
                        } else {
                          _pageState = 1;
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(60),
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF40F2E0),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 6.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "GET READY!",
                          style: TextStyle(
                              color: Color(0xFF050A30),
                              fontSize: 16,
                              fontFamily: 'NunitoBold'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            padding: EdgeInsets.all(20),
            width: _loginWidth,
            height: _loginHeight,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
            decoration: BoxDecoration(
                color: Color(0xFFE0FFFF).withOpacity(_loginOpacity),
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
                        "Sign in to Continue",
                        style: TextStyle(
                            color: Color(0xFF050A30),
                            fontSize: 20,
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
                      hint: "Your password",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 20.0,
                          child: Row(
                            children: <Widget>[
                              Theme(
                                data: ThemeData(
                                    unselectedWidgetColor: Color(0xFF40F2E0)),
                                child: Checkbox(
                                  value: _rememberMe,
                                  checkColor: Color(0xFF40F2E0),
                                  activeColor: Colors.white,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                'Remember me',
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 13,
                                    fontFamily: 'NunitoBold'),
                              ),
                            ],
                          ),
                        ),
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
                        buttonText: "SIGN IN",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageState = 2;
                        });
                      },
                      child: SecondaryButton(
                        buttonText: "CREATE NEW ACCOUNT",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          AnimatedContainer(
            height: _registerHeight,
            padding: EdgeInsets.all(32),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            transform: Matrix4.translationValues(0, _registerYOffset, 1),
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
                        setState(() {
                          _pageState = 1;
                        });
                      },
                      child: SecondaryButton(
                        buttonText: "BACK TO LOGIN",
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
