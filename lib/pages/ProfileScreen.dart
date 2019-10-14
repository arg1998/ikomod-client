import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../models/Constants.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("پروفایل"),
          actions: [
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
          backgroundColor: Colors.blueAccent),
      body: CollapsingList(),
    );
  }
}

class CollapsingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double profileHeight = screenSize.width * 0.3;
    final double fixSizedBox = 10.0;

    return CustomScrollView(slivers: <Widget>[
      SliverToBoxAdapter(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              // color: Colors.grey,
              child: Padding(
                padding: EdgeInsets.all(fixSizedBox),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      'شیما',
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(
                      width: fixSizedBox,
                      height: fixSizedBox,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(profileHeight / 2),
                      child: Container(
                        width: profileHeight,
                        height: profileHeight,
                        child: Image.network('https://picsum.photos/200'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 5),
              // height: screenSize.width * 0.25,
              width: double.infinity,
              // color: Colors.yellowAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('آگهی ها'),
                      Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(8, 8))),
                      ),
                    ],
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  Column(
                    children: [
                      Text('برد ها'),
                      Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(8, 8))),
                      ),
                    ],
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              // color: Colors.lightBlue,
              width: screenSize.width * 0.8,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Text('درباره ی'),
                  ),
                  Card(
                    elevation: 2.3,
                    color: Colors.yellow,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text(
                        'با سلام شیما شیوعی هس.این که تست برای طراحی دمو میباشد با سلام شیما شیوعی هستم.این که تست برای طراحی دمو میباشد',
                        // textAlign: TextAlign.right,

                        overflow: TextOverflow.clip,
                        softWrap: true,
                      ),
                    ),
                    margin: EdgeInsets.only(bottom: 15),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          mainAxisSpacing: 5,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Image.network(
                'https://picsum.photos/350?random=${math.Random().nextInt(520)}',
                fit: BoxFit.cover,
              ),
            );
          },
          childCount: 20,
        ),
      )
    ]);
  }
}

void choiceAction(String choice) {
  if (choice == Constants.Subscribe) {
    print('subscribeing');
  } else if (choice == Constants.SignIn) {
    print('sign in');
  } else if (choice == Constants.Settings) {
    print('settings');
  }
}
