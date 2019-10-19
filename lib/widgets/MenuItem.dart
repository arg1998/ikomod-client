import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'IconImage.dart';
import 'ProfileImage.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final String badgeValue;
  final IconImageAsset icon;
  final double size;
  final VoidCallback onPressed;
  final EdgeInsets margin;

  const MenuItem({
    Key key,
    this.text = "",
    this.badgeValue,
    this.icon,
    this.size = 65,
    this.onPressed,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool hasBadge = badgeValue != null;

    return Container(
      margin: margin ?? EdgeInsets.all(0),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            ProfileImage.fromAssets(
              url: icon.iconUrl,
              size: 55,
              showBadges: hasBadge,
              badges: [
                if (hasBadge)
                  ProfileBadge.square(
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      child: Center(
                        child: Text(
                          badgeValue,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "dinar",
                          ),
                        ),
                      ),
                    ),
                    size: 25,
                    angle: 3 * pi / 4,
                    radiusOffset: 20,
                  )
              ],
              imageFitMode: BoxFit.contain,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 18, fontFamily: "yekan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
