import 'package:etics_app/dashboard.dart';
import 'package:etics_app/start-page/start_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AuthenticationModel extends ChangeNotifier {
  bool _initialized = false;
  bool get initialized => _initialized;

  User _user;
  User get user => _user;

  AuthenticationModel() {
    initialize();
  }

  Future<void> initialize() async {
    await Future.delayed(Duration(seconds: 3));
    await Firebase.initializeApp();

    _user = FirebaseAuth.instance.currentUser;
    notifyListeners();

    FirebaseAuth.instance
      .authStateChanges()
      .listen((user) {
        _user = user;
        notifyListeners();
      });

    _initialized = true;
    notifyListeners();
  }

  Future signUp({String email, String password}) async {
    var userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email, password: password);
    _user = userCredential.user;
    notifyListeners();
  }

  Future signIn({String email, String password}) async {
    var userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password);
    _user = userCredential.user;
    notifyListeners();
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    _user = null;
    notifyListeners();
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
                duration: Duration(milliseconds: 1000),
                child: (authentication.user != null)
                  ? Dashboard()
                  : StartPage());
          }
        ));
  }
}