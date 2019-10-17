import 'package:flutter/material.dart';
import 'Coin.dart';
import 'HomeMenuModal.dart';
import 'IconImage.dart';

AppBar buildHomeAppBar(BuildContext context) {
  final Size screenSize = MediaQuery.of(context).size;

  return AppBar(
    titleSpacing: 0,
    centerTitle: true,
    leading: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () async {
        showDialog(
          context: context,
          builder: (ctx) {
            return HomeMenuModal(screenSize: screenSize);
          },
        );
      },
    ),
    title: HomeAppBarTitle(
      coins: "۱۶۳۸",
    ),
    actions: [
      IconImage(
        onTap: () {},
        icon: IconImageAsset.search,
        size: 24,
      ),
      IconImage(
        icon: IconImageAsset.bell,
        size: 24,
      ),
    ],
  );
}

class HomeAppBarTitle extends StatelessWidget {
  final String coins;

  const HomeAppBarTitle({Key key, this.coins = "۳۴۷۱"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Coin(coins: coins),
        Spacer(),
        Text("آی کمد"),
        Spacer(),
      ],
    );
  }
}
