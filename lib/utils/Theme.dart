import 'package:flutter/material.dart';

const MaterialColor primarySwatch = Colors.pink;
const TextTheme textTheme = TextTheme(title: TextStyle(fontSize: 22));

ThemeData generateTheme(BuildContext context) {
  ThemeData appTheme = Theme.of(context);

  return ThemeData(
    primarySwatch: primarySwatch,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
          fontSize: 23,
          fontFamily: "yekan",
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
