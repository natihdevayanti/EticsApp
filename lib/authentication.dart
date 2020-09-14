import 'package:etics_app/dashboard.dart';
import 'package:etics_app/start-page/start_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AuthenticationModel extends ChangeNotifier {
  Future<bool> _loggedIn;
  Future<bool> get loggedIn => _loggedIn;

  AuthenticationModel() {
    _loggedIn = Future<bool>(() async {
      await Future.delayed(Duration(seconds: 3));
      await Firebase.initializeApp();

      FirebaseAuth.instance
        .authStateChanges()
        .listen((user) {
          _loggedIn = Future<bool>(() async {
            return (user != null && user.emailVerified);
          });
        });

      var user = FirebaseAuth.instance.currentUser;
      return (user != null && user.emailVerified);
    });
  }
}

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(context) {
    return ChangeNotifierProvider<AuthenticationModel>(
        create: (context) => AuthenticationModel(),
        child: Consumer<AuthenticationModel>(
          builder: (context, authentication, child) {
            return FutureBuilder<bool>(
                future: authentication.loggedIn,
                builder: (context, loggedIn) {
                  return AnimatedCrossFade(
                      duration: Duration(seconds: 2),
                      crossFadeState: (loggedIn.hasData && loggedIn.data)
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: Dashboard(),
                      secondChild: StartPage());
                });
          }
        ));
  }
}