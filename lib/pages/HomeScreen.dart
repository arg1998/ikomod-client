import 'package:flutter/material.dart';
import 'package:ikomod/widgets/FilterCategoriesHorizontalList.dart';
import 'package:ikomod/widgets/SpecialPostsList.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";

  final specialPostsImages = List<String>.generate(20, (index) {
    return "https://picsum.photos/300/400?random=${index}";
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () async {
            //TODO: implement home menu button
          },
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 5),
                  Text(
                    "۲۳۵۰",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "iransans",
                        color: Color(0XFFff9500).withOpacity(0.9)),
                  ),
                  SizedBox(width: 5),
                  Image.asset(
                    "assets/images/coin-small.png",
                    height: 25,
                  ),
                ],
              ),
            ),
            Spacer(),
            Text("آی کمد"),
            Spacer(),
          ],
        ),
        primary: true,
        actions: [
          Image.asset(
            "assets/images/search.png",
            height: 24,
            width: 24,
          ),
          Image.asset(
            "assets/images/bell.png",
            height: 24,
            width: 24,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            Duration(seconds: 2),
            () => Future.value(true),
          );
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverToBoxAdapter(
                child: SpecialPostList(
                  posts: specialPostsImages,
                  itemWidth: screenSize.width * 0.4,
                  height: screenSize.height * 0.4,
                ),
              ),
              FilterCategoriesHorizontalList(height: 90),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 1000,
                  child: Placeholder(
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
