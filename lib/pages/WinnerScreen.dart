import 'package:flutter/material.dart';
import 'package:ikomod/widgets/RanksPost.dart';

class WinnerScreen extends StatelessWidget {
  static const routeName = "/winner";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("برنده ها"),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(),
                child: Column(
                  children: <Widget>[
                    RanksPost(
                      personNumber: Text(
                        'نفر اول',
                        style: TextStyle(
                          fontFamily: 'dinar',
                          fontSize: 19,
                        ),
                      ),
                      rankNumber: 1,
                    ),
                    RanksPost(
                      personNumber: Text(
                        'نفر دوم',
                        style: TextStyle(
                          fontFamily: 'dinar',
                          fontSize: 19,
                        ),
                      ),
                      rankNumber: 2,
                    ),
                    RanksPost(
                      personNumber: Text(
                        'نفر سوم',
                        style: TextStyle(
                          fontFamily: 'dinar',
                          fontSize: 19,
                        ),
                      ),
                      rankNumber: 3,
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
