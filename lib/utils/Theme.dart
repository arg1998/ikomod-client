import 'package:flutter/material.dart';

const MaterialColor primarySwatch = Colors.pink;

ThemeData generateTheme(BuildContext context) {
  ThemeData appTheme = Theme.of(context);

  TextTheme textTheme = appTheme.textTheme.copyWith(
    title: TextStyle(fontFamily: "ziba"),
    headline: TextStyle(fontFamily: "ziba", fontWeight: FontWeight.w600),
    // subhead: TextStyle(fontSize: 20, fontFamily: "ziba", height: 1.5)
  );

  return ThemeData(
    primarySwatch: primarySwatch,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
          fontSize: 30,
          fontFamily: "ziba",
          fontWeight: FontWeight.w900,
        ),
      ),
    ),
  );
}
