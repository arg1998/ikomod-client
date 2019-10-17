import 'package:flutter/material.dart';
import 'package:ikomod/widgets/FilterCategoriesHorizontalList.dart';
import 'package:ikomod/widgets/FilterModal.dart';
import 'package:ikomod/widgets/HomeAppBar.dart';
import 'package:ikomod/widgets/HomeBottomNavBar.dart';
import 'package:ikomod/widgets/IconImage.dart';
import 'package:ikomod/widgets/MainPostsList.dart';
import 'package:ikomod/widgets/SpecialPostsList.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";

  final specialPostsImages = List<String>.generate(20, (index) {
    return "https://picsum.photos/200/400?random=${index}";
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    const double bottomBarIconSize = 40;

    return Scaffold(
      bottomNavigationBar: HomeBottomNavBar(
        iconSize: bottomBarIconSize,
      ),
      floatingActionButton: SizedBox(
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
      ),
      appBar: buildHomeAppBar(context),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            Duration(seconds: 2),
            () => Future.value(true),
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
                  posts: specialPostsImages,
                  itemWidth: screenSize.width * 0.4,
                  height: screenSize.height * 0.4,
                ),
              ),
              FilterCategoriesHorizontalList(height: 90),
              SliverToBoxAdapter(child: SizedBox(height: 25)),
              MainPostsList(),
            ],
          ),
        ),
      ),
    );
  }
}
