import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ikomod/pages/WinnerScreen.dart';
import 'package:ikomod/pages/CameraFeed.dart';
import './utils/Theme.dart';
import './pages/CompetitionScreen.dart';
import './pages/HomeScreen.dart';
import './pages/NewPostScreen.dart';
import './pages/PlansScreen.dart';
import './pages/PostManagementScreen.dart';
import './pages/PostScreen.dart';
import './pages/ProfileScreen.dart';
import './pages/SplashScreen.dart';
import './pages/LeaderBoardScreen.dart';

CameraDescription camera;

Future<void> main() async {
  final List<CameraDescription> cameras = await availableCameras();
  camera = cameras.first;
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
    WinnerScreen.routeName: (_) => WinnerScreen(),
    CameraFeed.routeName: (_) => CameraFeed(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale("fa", 'IR')],
      locale: Locale("fa", "IR"),
      routes: _routes,
      theme: generateTheme(context),
    );
  }
}
