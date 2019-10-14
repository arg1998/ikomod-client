import 'package:flutter/material.dart';

class LeaderBoardScreen extends StatelessWidget {
  static const routeName = "/leaderboard";
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("خانم های برتر در لحظه "),
        backgroundColor: Colors.blueAccent,
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
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          // color: Colors.red[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    '۱۰۰ سکه',
                                    textDirection: TextDirection.rtl,
                                  ),
                                  Icon(Icons.arrow_drop_up),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text('مریم'),
                                  SizedBox(
                                    width: 10,
                                    height: 10,
                                  ),
                                  // TODO: replace with imageProfile widget
                                  CircleAvatar(
                                    backgroundColor: Colors.deepOrangeAccent,
                                  ),
                                  SizedBox(
                                    width: 10,
                                    height: 10,
                                  ),
                                  Text('${index}')
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        indent: 40,
                        endIndent: 40,
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

//  body: Container(
// width: double.infinity,
// height: double.infinity,
// color: Colors.lightBlue,
// child: ListView.builder(
// itemCount: 15,
// itemBuilder: (BuildContext context, int index) {
// return Padding(
// padding: const EdgeInsets.all(5),
// child: Container(
// width: screenSize.width * 0.3,
// height: screenSize.height * 0.12,
// decoration: BoxDecoration(
// color: Colors.red[100],
// borderRadius: BorderRadius.circular(8),
// ),
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 10),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// Row(
// children: <Widget>[
// Text('صد سکه'),
// Icon(Icons.arrow_drop_up),
// ],
// ),
// Row(
// children: <Widget>[
// Text('مریم'),
// SizedBox(
// width: 10,
// height: 10,
// ),
// TODO: replace with imageProfile widget
// CircleAvatar(
// backgroundColor: Colors.deepOrangeAccent,
// ),
// SizedBox(
// width: 10,
// height: 10,
// ),
// Text('${index}')
// ],
// )
// ],
// ),
// ),
// ),
// );
// },
// ),
// ),
