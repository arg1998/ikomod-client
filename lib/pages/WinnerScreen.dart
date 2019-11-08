import 'package:flutter/material.dart';
import 'package:ikomod/widgets/RanksPost.dart';

class WinnerScreen extends StatelessWidget {
  static const routeName = "/winner";
  final rankTitle = <String>[
    'نفر اول',
    'نفر دوم',
    'نفر سوم',
    'نفر چهارم',
    'نفر پنجم'
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("برنده ها"),
      ),
      body: Container(
        height: double.infinity,
        // color: Colors.amberAccent,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return RanksPost(
              personNumber: Text(
                rankTitle[index],
                style: TextStyle(
                  fontFamily: 'ziba',
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  color: Colors.black
                ),
              ),
              rankNumber: index + 1,
            );
          },
        ),
      ),
    );
  }
}
