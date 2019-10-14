import 'package:flutter/material.dart';
import 'dart:async';

import 'package:ikomod/pages/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _active = false;
  int sec = 3;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_active) {
      StreamSubscription s;
      s = Stream.periodic(Duration(seconds: 1)).take(4).listen((count) {
        sec--;
        if (sec < 0) {
          s.cancel();
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        } else {
          setState(() {});
        }
      });

      _active = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Wait ! ${sec}s"),
      ),
    );
  }
}
