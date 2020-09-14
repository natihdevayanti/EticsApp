import 'package:etics_app/authentication.dart';
import 'package:etics_app/start-page/start_page.dart';
import 'package:etics_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _backgroundColor = Colors.black12;
  double _headingTop = 200;

  @override
  Widget build(BuildContext context) {
    return Consumer<StartPageModel>(
        builder: (context, startPage, child) {
          switch (startPage.state) {
            case StartPageState.None:
              _backgroundColor = Colors.black12;
              _headingTop = 250;
              break;

            case StartPageState.Login:
            case StartPageState.Register:
              _backgroundColor = Colors.black54;
              _headingTop = 50;
              break;
          }

          return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                switch (startPage.state) {
                  case StartPageState.None:
                    startPage.state = StartPageState.Login;
                    break;

                  case StartPageState.Login:
                    startPage.state = StartPageState.None;
                    break;

                  case StartPageState.Register:
                    startPage.state = StartPageState.Login;
                    break;
                }
              },
              child: AnimatedContainer(
                color: _backgroundColor,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 1000),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AnimatedContainer(
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: Duration(milliseconds: 1000),
                      margin: EdgeInsets.only(top: _headingTop),
                      child: Text(
                        "ETICS",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontFamily: 'NunitoExtraBold'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 150, right: 150),
                      height: 10,
                      color: Colors.white,
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: Text(
                        "Keeping you and your beloved ones safe.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'NunitoLight'),
                      ),
                    ),
                    createTapToContinue(),
                  ],
                ),
              ));
        });
  }

  Widget createTapToContinue() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Consumer2<AuthenticationModel, StartPageModel>(
        builder: (context, authentication, startPage, child) {
          return FutureBuilder<bool>(
            future: authentication.loggedIn,
            builder: (context, loggedIn) {
              if (startPage.state != StartPageState.None) {
                return Container();
              }

              return Text(
                (loggedIn.hasData) ? "Tap to continue" : "Loading...",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'NunitoLight'),
              );
            },
          );
        },
      ),
    );
  }
}