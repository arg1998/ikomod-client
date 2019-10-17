import 'package:flutter/material.dart';
import 'package:ikomod/widgets/IconImage.dart';
import 'package:ikomod/widgets/MenuItem.dart';
import 'dart:math' show pi;
import 'ProfileImage.dart';

class HomeMenuModal extends StatelessWidget {
  const HomeMenuModal({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  Widget getCircle([Color color = Colors.green]) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          color: Colors.pink,
          width: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    const Widget divider = Divider(
      color: Colors.black26,
      indent: 45,
      endIndent: 20,
      height: 2,
      thickness: 0.5,
    );

    return Center(
      child: Container(
        width: screenSize.width * 0.7,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: ProfileImage.fromUrl(
                  url: "https://picsum.photos/200",
                  border: Border.all(
                    color: appTheme.primaryColor,
                    width: 3,
                  ),
                  size: 110,
                  showBadges: true,
                  margin: EdgeInsets.all(10),
                  badges: [
                    ProfileBadge.square(
                      child: CircleAvatar(
                        backgroundColor: Colors.pink,
                        child: Center(
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      size: 30,
                      angle: 14 * pi / 8,
                    )
                  ],
                ),
              ),
              Text(
                "امیر رضا قربانی",
                style: TextStyle(fontSize: 25, fontFamily: "dinar"),
              ),
              Divider(
                color: Colors.pink,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              MenuItem(
                icon: IconImageAsset.chat,
                badgeValue: "۳۴",
                text: "پیام های من",
              ),
              divider,
              MenuItem(
                icon: IconImageAsset.ads,
                text: "آگهی های من",
              ),
              divider,
              MenuItem(
                icon: IconImageAsset.article,
                text: "مقالات",
                badgeValue: "۲",
              ),
              divider,
              MenuItem(
                icon: IconImageAsset.support,
                text: "تماس با ما",
              ),
              divider,
              MenuItem(
                icon: IconImageAsset.gears,
                text: "تنظیمات",
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
