import 'package:flutter/material.dart';
import 'package:ikomod/utils/ConvertToPersian.dart';
import 'package:ikomod/widgets/Coin.dart';
import 'package:ikomod/widgets/ProfileImage.dart';
import 'dart:math' as math;

class LeaderBoardScreen extends StatelessWidget {
  static const routeName = "/leaderboard";

  Border borderDecision(int index) {
    if (index == 0) {
      return Border.all(color: Colors.yellow, width: 2);
    } else if (index == 1) {
      return Border.all(color: Color(0xFFC0C0C0), width: 2);
    } else if (index == 2) {
      return Border.all(color: Color(0XFFCD7F32), width: 2);
    } else {
      return Border.all(color: Colors.pink, width: 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("خانم های برتر در لحظه "),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // color: Colors.lightBlue,
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  width: screenSize.width * 0.3,
                  // height: screenSize.height * 0.19,
                  // color: Colors.yellowAccent,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                toPersian('${index + 1}'),
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 22),
                              ),
                              SizedBox(
                                width: 10,
                                height: 10,
                              ),
                              // TODO: replace with imageProfile widget

                              ProfileImage.fromUrl(
                                url:
                                    'https://picsum.photos/350?random=${math.Random().nextInt(520)}',
                                size: 70,
                                border: borderDecision(index),
                              ),
                              SizedBox(
                                width: 10,
                                height: 10,
                              ),
                              Text(
                                'مریم',
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 20),
                              ),
                              SizedBox(
                                width: 10,
                                height: 10,
                              ),

                              Spacer(
                                flex: 1,
                              ),
                              Coin(
                                coins: '۱۰۰۰',
                                coinSize: 25,
                                trailing: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 1),
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        indent: 35,
                        endIndent: 5,
                        color: Colors.black54,
                        height: 1,
                        thickness: 1,
                      )
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
