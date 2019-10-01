import 'package:flutter/material.dart';
import 'package:ikomod/pages/CompetitionScreen.dart';
import 'package:ikomod/pages/HomeScreen.dart';
import 'package:ikomod/pages/NewPostScreen.dart';
import 'package:ikomod/pages/PlansScreen.dart';
import 'package:ikomod/pages/PostManagementScreen.dart';
import 'package:ikomod/pages/PostScreen.dart';
import 'package:ikomod/pages/ProfileScreen.dart';
import './pages/SplashScreen.dart';

void main() {
  runApp(IkomodApp());
}

class IkomodApp extends StatelessWidget {
  final _routes = <String, WidgetBuilder>{
    SplashScreen.routeName: (_) => SplashScreen(),
    HomeScreen.routeName: (_) => HomeScreen(),
    CompetitionScreen.routeName: (_) => CompetitionScreen(),
    NewPostScreen.routeName: (_) => NewPostScreen(),
    PlansScreen.routeName: (_) => PlansScreen(),
    PostManagementScreen.routeName: (_) => PostManagementScreen(),
    PostScreen.routeName: (_) => PostScreen(),
    ProfileScreen.routeName: (_) => ProfileScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _routes,
      initialRoute: SplashScreen.routeName,
    );
  }
}
