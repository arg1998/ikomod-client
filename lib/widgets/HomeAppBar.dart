import 'package:flutter/material.dart';
import 'package:ikomod/utils/Helpers.dart';
import 'Coin.dart';
import 'HomeMenuModal.dart';
import 'IconImage.dart';
import '../FAKE_DATA/FakeUserData.dart' show SELF_USER;

AppBar buildHomeAppBar(BuildContext context) {
  final Size screenSize = MediaQuery.of(context).size;
  final String _coins = intToPersian(SELF_USER.coins, seperated: false);

  return AppBar(
    titleSpacing: 0,
    centerTitle: true,
    leading: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () async {
        showDialog(
          context: context,
          builder: (ctx) {
            return HomeMenuModal(
              screenSize: screenSize,
              selfUser: SELF_USER,
            );
          },
        );
      },
    ),
    title: HomeAppBarTitle(
      coins: _coins,
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
