import 'package:flutter/material.dart';
import './pages/CompetitionScreen.dart';
import './pages/HomeScreen.dart';
import './pages/NewPostScreen.dart';
import './pages/PlansScreen.dart';
import './pages/PostManagementScreen.dart';
import './pages/PostScreen.dart';
import './pages/ProfileScreen.dart';
import './pages/SplashScreen.dart';
import './pages/LeaderBoardScreen.dart';

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
    LeaderBoardScreen.routeName: (_) => LeaderBoardScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _routes,
      initialRoute: SplashScreen.routeName,
    );
  }
}
