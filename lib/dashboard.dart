import 'package:etics_app/authentication.dart';
import 'package:etics_app/widgets/wide_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  bool _signingOut = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: 100),
        child: Center(
          child: WideButton(
            text: "Sign Out",
            onTap: () {
              setState(() => _signingOut = true);
              var authentication = Provider.of<AuthenticationModel>(
                  context, listen: false);
              authentication.signOut()
                .then((_) => setState(() => _signingOut = false))
                .catchError((err) {
                  setState(() => _signingOut = false);
                  print("Sign out error " + err.toString());
                });
            },
            disable: _signingOut,
            progress: _signingOut,
          ),
        ));
  }
}