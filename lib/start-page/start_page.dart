
import 'package:etics_app/authentication.dart';
import 'package:etics_app/start-page/login.dart';
import 'package:etics_app/start-page/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum StartPageState {
  None,
  Login,
  Register,
}

class StartPageModel extends ChangeNotifier {
  StartPageState _state = StartPageState.None;

  StartPageState get state => _state;

  set state(StartPageState newState) {
    _state = newState;
    print(state);
    notifyListeners();
  }
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StartPageModel>(
      create: (context) => StartPageModel(),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Consumer<AuthenticationModel>(
          builder: (context, authentication, child) {
            List<Widget> widgets = [
              createTitle(),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 1000),
                child: authentication.initialized && authentication.user == null
                  ? createTapToContinue()
                  : createLoading(),
              ),
            ];

            if (authentication.initialized && authentication.user == null) {
              widgets.addAll([
                Login(),
                Register(),
              ]);
            }

            return Stack(children: widgets);
          },
        ),
      )
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
      key: ValueKey("loading"),
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
    return Consumer<StartPageModel>(
      key: ValueKey("tapToContinue"),
      builder: (context, startPage, child) {
        return GestureDetector(
          onTap: () {
            var startPage = Provider.of<StartPageModel>(context, listen: false);
            startPage.state = StartPageState.Login;
          },
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 1000),
            child: (startPage.state == StartPageState.None)
              ? Container(
                  key: ValueKey("tap to continue"),
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
                )
              : Container(
                  key: ValueKey("null container"),
                  width: double.maxFinite,
                  height: double.maxFinite,
                ),
          )
        );
      },
    );
  }
}
