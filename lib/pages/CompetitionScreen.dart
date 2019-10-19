import 'package:flutter/material.dart';
import '../widgets/SplashButton.dart';

class CompetitionScreen extends StatelessWidget {
  static const routeName = "/competition";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double day = 12;
    double hour = 16;
    double minutes = 5;
    double second = 23;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("مسابقات "),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // color: Colors.yellowAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenSize.width * 0.5,
              height: screenSize.width * 0.4,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromRGBO(255, 209, 66, 1),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('اعلام نتایج'),
                  Text('${day}: ${hour}: ${minutes}: ${second}'),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 20),
                Expanded(
                  child: SplashButton(text: 'برنده ها', onPress: () {}),
                ),
                Spacer(),
                Expanded(
                  child: SplashButton(text: 'برتر ها', onPress: () {}),
                ),
                SizedBox(width: 20),
              ],
            )
          ],
        ),
      ),
    );
  }
}
