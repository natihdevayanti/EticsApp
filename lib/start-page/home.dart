import 'package:etics_app/authentication.dart';
import 'package:etics_app/start-page/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        createTitle(),
        Consumer<AuthenticationModel>(
          builder: (context, authentication, child) {
            return FutureBuilder<bool>(
              future: authentication.loggedIn,
              builder: (context, loggedIn) {
                return AnimatedCrossFade(
                  duration: Duration(milliseconds: 1000),
                  crossFadeState: loggedIn.hasData
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: createTapToContinue(),
                  secondChild: createLoading(),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget createTitle() {
    return Consumer<StartPageModel>(
      builder: (context, startPage, child) {
        var windowHeight = MediaQuery.of(context).size.height;
        return AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          width: double.maxFinite,
          height: (startPage.state == StartPageState.None)
              ? windowHeight
              : windowHeight - 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "ETICS",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontFamily: 'NunitoExtraBold'),
                ),
              ),
              Container(
                width: 150,
                height: 10,
                color: Colors.white,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "Keeping you and your\nbeloved ones safe.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'NunitoLight'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget createLoading() {
    return Container(
      color: Colors.transparent,
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
          Container(height: 100),
        ],
      ),
    );
  }

  Widget createTapToContinue() {
    return GestureDetector(
      onTap: () {
        var startPage = Provider.of<StartPageModel>(context, listen: false);
        startPage.state = StartPageState.Login;
      },
      child: Consumer<StartPageModel>(
        builder: (context, startPage, child) {
          return AnimatedCrossFade(
            duration: Duration(milliseconds: 1000),
            crossFadeState: (startPage.state == StartPageState.None)
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Container(
              color: Colors.transparent,
              width: double.maxFinite,
              height: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Tap to continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'NunitoLight'),
                  ),
                  Container(height: 100),
                ],
              ),
            ),
            secondChild: Container(
              width: double.maxFinite,
              height: double.maxFinite,
            ),
          );
        },
      ),
    );
  }
}