import 'package:flutter/material.dart';
import 'package:ikomod/widgets/PostCard.dart';
import 'package:ikomod/widgets/ProfileImage.dart';
import 'package:ikomod/widgets/ShadowLabel.dart';
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
      ),
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

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              Container(
                // color: Colors.lightBlue,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(fixSizedBox),
                  child: Row(
                    children: [
                      SizedBox(
                        width: fixSizedBox,
                        height: fixSizedBox,
                      ),
                      ProfileImage.fromUrl(
                        size: profileHeight,
                        url: 'https://picsum.photos/200',
                        imageFitMode: BoxFit.cover,
                        border: Border.all(
                          width: 3,
                          color: Color.fromRGBO(255, 0, 0, 1),
                        ),
                      ),
                      SizedBox(width: fixSizedBox + 10),
                      Text(
                        'شیما',
                        style: TextStyle(
                          fontFamily: 'iransans',
                          // fontWeight: FontWeight.w400,
                          fontSize: 26,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                // height: screenSize.width * 0.25,
                width: double.infinity,
                // color: Colors.yellowAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'آگهی ها',
                          style: TextStyle(
                            fontFamily: 'ziba',
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 10),
                        new ShadowLabel(
                          number: '۲۲',
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'برد ها',
                          style: TextStyle(
                            fontFamily: 'ziba',
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 10),
                        ShadowLabel(
                          number: '۱۰',
                        )
                      ],
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.black26,
                indent: 50,
                endIndent: 50,
              ),
              SizedBox(height: 14),
              Container(
                alignment: Alignment.topRight,
                // color: Colors.lightBlue,
                width: screenSize.width * 0.8,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.info_outline, color: Colors.red),
                        SizedBox(width: 5),
                        Text(
                          ' درباره ی من',
                          style: TextStyle(
                            fontFamily: 'ziba',
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Card(
                      elevation: 3,
                      // color: Colors.yellow,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                        child: Text(
                          'این یک تست آزمایشی می باشد.برای مشاهده ی بیشتر به اپ اصلی مزاحعه کنید به اپلیکیشن امتیاز دهید سپاس گزاریم از بازدید شما',
                          style: TextStyle(
                            fontFamily: 'iransans',
                            // fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.clip,
                          softWrap: true,
                        ),
                      ),
                      margin: EdgeInsets.only(bottom: 20),
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
            childAspectRatio: 0.62,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return PostCard(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                hasCardWith: false,
                // cardWidth: double.infinity,
              );
            },
            childCount: 20,
          ),
        )
      ],
    );
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
