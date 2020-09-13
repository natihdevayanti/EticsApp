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
  var _headingColor = Color(0xFFE0FFFF);
  double _headingTop = 200;

  @override
  Widget build(BuildContext context) {
    return Consumer<StartPageModel>(
        builder: (context, startPage, child) {
          switch (startPage.state) {
            case StartPageState.None:
              _backgroundColor = Colors.black12;
              _headingColor = Color(0xFFE0FFFF);
              _headingTop = 320;
              break;

            case StartPageState.Login:
            case StartPageState.Register:
              _backgroundColor = Colors.black54;
              _headingColor = Color(0xFFE0FFFF);
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
                    Container(
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
                          Container(
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
                    (startPage.state == StartPageState.None)
                      ? Container(
                          margin: EdgeInsets.all(60),
                          child: Container(
                            // onTap: () {
                            //   print("get ready");
                            //   startPage.state = StartPageState.Login;
                            // },
                            child: PrimaryButton(
                              buttonText: "GET READY!"
                            ),
                          ),
                        )
                      : Container(),
                  ],
                ),
              ));
        });
  }
}