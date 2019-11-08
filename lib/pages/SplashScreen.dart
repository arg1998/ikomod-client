import 'package:flutter/material.dart';
import 'package:ikomod/pages/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> progress,
      entranceOpacity,
      textExitOpacity,
      imageExitOpacity;
  Animation<Offset> yOffset;

  void _onFinishedLoading() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });

    yOffset = Tween<Offset>(
      begin: Offset(0, 200),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        curve: Interval(
          0.0,
          0.3,
          curve: Curves.decelerate,
        ),
        parent: controller,
      ),
    );

    entranceOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        curve: Interval(
          0.0,
          0.35,
          curve: Curves.easeOut,
        ),
        parent: controller,
      ),
    );
    textExitOpacity = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        curve: Interval(
          0.7,
          1.0,
          curve: Curves.linear,
        ),
        parent: controller,
      ),
    );
    imageExitOpacity = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        curve: Interval(
          0.9,
          1.0,
          curve: Curves.linear,
        ),
        parent: controller,
      ),
    );

    progress = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        curve: Curves.linear,
        parent: controller,
      ),
    );

    controller.forward().whenComplete(_onFinishedLoading);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Opacity(
                  opacity: entranceOpacity.value * textExitOpacity.value,
                  child: const Text(
                    "آی کمد",
                    style: TextStyle(
                      fontFamily: "ziba",
                      fontSize: 72,
                      fontWeight: FontWeight.w700,
                      color: Colors.pink,
                    ),
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: entranceOpacity.value * imageExitOpacity.value,
              child: Transform.translate(
                offset: yOffset.value,
                child: Image.asset(
                  "assets/images/splash_logo.png",
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            Spacer(),
            LinearProgressIndicator(
              value: progress.value,
              backgroundColor: Colors.amberAccent.withOpacity(0.5),
            )
          ],
        ),
      ),
    );
  }
}
