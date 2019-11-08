import 'package:flutter/material.dart';
import 'package:ikomod/widgets/FilterCategoriesHorizontalList.dart';
import 'package:ikomod/widgets/FilterModal.dart';
import 'package:ikomod/widgets/HeadLine.dart';
import 'package:ikomod/widgets/HomeAppBar.dart';
import 'package:ikomod/widgets/HomeBottomNavBar.dart';
import 'package:ikomod/widgets/IconImage.dart';
import 'package:ikomod/widgets/MainPostsList.dart';
import 'package:ikomod/widgets/SpecialPostsList.dart';
import '../FAKE_DATA/FakePostData.dart' as FAKE_POSTS;

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildFAB(Size screenSize) {
    return SizedBox(
      height: 65,
      width: 65,
      child: FloatingActionButton(
        elevation: 4,
        onPressed: () {
          showDialog(
            context: context,
            builder: (contex) => FilterModal(screenSize: screenSize),
          );
        },
        child: IconImage(
          margin: EdgeInsets.all(3),
          icon: IconImageAsset.filter,
          size: double.infinity,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    const double bottomBarIconSize = 40;

    return Scaffold(
      bottomNavigationBar: HomeBottomNavBar(
        iconSize: bottomBarIconSize,
      ),
      floatingActionButton: _buildFAB(screenSize),
      appBar: buildHomeAppBar(context),
      body: RefreshIndicator(
        onRefresh: () {
          FAKE_POSTS.refreshHomeLists();
          return Future.delayed(
            Duration(seconds: 2),
            () {
              setState(() {});
              return Future.value(true);
            },
          );
        },
        color: Theme.of(context).primaryColor,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverToBoxAdapter(
                child: SpecialPostList(
                  posts: FAKE_POSTS.specialPosts,
                  itemWidth: screenSize.width * 0.4,
                  height: screenSize.height * 0.4,
                ),
              ),
              SliverToBoxAdapter(
                child: HeadLine(
                  text: "سایر آگهی ها",
                  textPadding: EdgeInsets.only(top: 10, right: 10),
                ),
              ),
              FilterCategoriesHorizontalList(height: 60),
              SliverToBoxAdapter(child: SizedBox(height: 25)),
              MainPostsList(),
            ],
          ),
        ),
      ),
    );
  }
}
