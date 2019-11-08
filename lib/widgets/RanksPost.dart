import 'package:flutter/material.dart';
import 'package:ikomod/utils/CustomFontIcons.dart';
import 'CustomLinePaint.dart';
import 'PostCard.dart';
import 'ProfileImage.dart';
import 'dart:math' show sin, cos, pi;

class RanksPost extends StatelessWidget {
  final Text personNumber;
  final int rankNumber;

  const RanksPost({Key key, this.personNumber, this.rankNumber})
      : super(key: key);

  Color personNumberFillColor() {
    Color color;
    switch (rankNumber) {
      case 1:
        color = Color(0xFFFFD801);
        break;
      case 2:
        color = Color(0xFFaaa9ad);
        break;
      case 3:
        color = Color(0XFFd28c47);
        break;
      default:
        color = Colors.transparent;
        break;
    }
    return color;
  }

  Border personNumberBorder({double borderWidth = 2}) {
    if (rankNumber > 3) {
      return Border.all(
        color: Colors.pink,
        width: borderWidth,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double badgeHeight = screenSize.width / 15.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: personNumberFillColor(),
            border: personNumberBorder(),
            borderRadius: BorderRadius.circular(45),
          ),
          child: personNumber,
        ),

        SizedBox(
          height: 15,
        ),
        ProfileImage.fromUrl(
          showBadges: true,
          border: Border.all(color: Colors.pink, width: 1),
          url: 'https://picsum.photos/150',
          size: 80,
          margin: EdgeInsets.all(0),
          badges: [
            ProfileBadge(
              height: badgeHeight,
              width: badgeHeight,
              angle: pi / 6,
              child: DecoratedBox(
                position: DecorationPosition.background,
                decoration: BoxDecoration(),
                child: Container(
                  child: Center(
                    child: Text(
                      '۲۲',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "dinar",
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              ),
              // offset: const Offset(4, 4),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        // Triangle(
        //   width: screenSize.width * 0.4,
        //   height: screenSize.width * 0.2,
        //   lineWidth: 3,
        //   lineColor: Colors.redAccent,
        // ),
        new PostCard(
          cardWidth: screenSize.width * 0.68,
          hasCardWith: true,
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
