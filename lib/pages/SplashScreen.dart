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
  Animation<double> progress, opacity;
  Animation<Offset> yOffset;

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
          0.35,
          curve: Curves.decelerate,
        ),
        parent: controller,
      ),
    );

    opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        curve: Interval(
          0.0,
          0.5,
          curve: Curves.easeIn,
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

    controller.forward().whenComplete(() {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
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
                  opacity: opacity.value,
                  child: Text(
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
              opacity: opacity.value,
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
