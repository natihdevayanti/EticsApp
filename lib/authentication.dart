import 'package:etics_app/dashboard.dart';
import 'package:etics_app/start-page/start_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AuthenticationModel extends ChangeNotifier {
  User _user;
  User get user => _user;

  Future<bool> initialize() async {
    await Future.delayed(Duration(seconds: 3));
    await Firebase.initializeApp();

    _user = FirebaseAuth.instance.currentUser;

    FirebaseAuth.instance
      .authStateChanges()
      .listen((user) {
        _user = user;
      });

    return true;
  }

  Future<bool> logIn() async {
    await Future.delayed(Duration(seconds: 3));
    return false;
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
            return AnimatedSwitcher(
                duration: Duration(seconds: 2),
                child: (authentication.user != null)
                  ? Dashboard()
                  : StartPage());
          }
        ));
  }
}