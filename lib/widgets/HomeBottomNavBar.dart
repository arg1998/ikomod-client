import 'package:flutter/material.dart';

import 'IconImage.dart';

class HomeBottomNavBar extends StatelessWidget {
  final double iconSize;

  const HomeBottomNavBar({Key key, this.iconSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              offset: Offset(0, -3),
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 1)
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconImage(
              onTap: () {},
              icon: IconImageAsset.shopping,
              size: iconSize,
            ),
            IconImage(
              onTap: () {},
              margin: EdgeInsets.all(5),
              icon: IconImageAsset.plus,
              size: iconSize + 15,
            ),
            IconImage(
              onTap: () {},
              icon: IconImageAsset.trophy,
              size: iconSize,
            ),
          ],
        ),
      ),
    );
  }
}
