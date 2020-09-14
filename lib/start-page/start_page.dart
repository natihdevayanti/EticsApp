
import 'package:etics_app/authentication.dart';
import 'package:etics_app/start-page/home.dart';
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
    return ChangeNotifierProvider (
        create: (context) => StartPageModel(),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Consumer<StartPageModel>(
            builder: (context, startPage, child) {
              return WillPopScope(
                onWillPop: () async {
                  switch (startPage.state) {
                    case StartPageState.None:
                      return true;

                    case StartPageState.Login:
                      startPage.state = StartPageState.None;
                      break;

                    case StartPageState.Register:
                      startPage.state = StartPageState.Login;
                      break;
                  }

                  return false;
                },
                child: Consumer<AuthenticationModel>(
                  builder: (context, authentication, child) {
                    return FutureBuilder<bool>(
                        future: authentication.loggedIn,
                        builder: (context, loggedIn) {
                          List<Widget> widgets = [ Home() ];
                          if (loggedIn.hasData) {
                            widgets.addAll([
                              Login(),
                              Register(),
                            ]);
                          }

                          return Stack(children: widgets);
                        });
                  },
                ));
            },
          ),
        ));
  }
}
