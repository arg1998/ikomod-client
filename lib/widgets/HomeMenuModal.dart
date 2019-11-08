import 'package:flutter/material.dart';
import 'package:ikomod/models/User.model.dart';
import 'package:ikomod/widgets/IconImage.dart';
import 'package:ikomod/widgets/MenuItem.dart';
import 'dart:math' show pi;
import 'ProfileImage.dart';

class HomeMenuModal extends StatelessWidget {
  final UserModel selfUser;
  final Size screenSize;

  const HomeMenuModal({
    Key key,
    this.selfUser,
    @required this.screenSize,
  }) : super(key: key);

  Widget _buildProfileImage(Color borderColor) {
    return ProfileImage.fromUrl(
      url: selfUser.imageUrl,
      border: Border.all(
        color: borderColor,
        width: 3,
      ),
      size: 120,
      showBadges: true,
      margin: EdgeInsets.all(10),
      badges: [
        ProfileBadge.square(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: borderColor,
                width: 2,
              ),
            ),
            child: IconImage(
              icon: IconImageAsset.editSmall,
              padding: EdgeInsets.all(0),
              onTap: () {
                //TODO: edit profile page
              },
            ),
          ),
          size: 35,
          angle: -pi / 4,
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: Colors.black26,
      indent: 45,
      endIndent: 20,
      height: 2,
      thickness: 1,
    );
  }

  Widget _buildUserName() {
    return Text(
      selfUser.name,
      style: TextStyle(fontSize: 25, fontFamily: "dinar"),
    );
  }

  Widget _buildUserBio() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
      child: Text(
        selfUser.bio,
        style: TextStyle(fontFamily: "iransans", fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: screenSize.height * 0.9,
            maxWidth: screenSize.width * 0.7,
          ),
          child: SingleChildScrollView(
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildProfileImage(appTheme.primaryColor),
                  _buildUserName(),
                  _buildUserBio(),
                  _buildDivider(),
                  MenuItem(
                    icon: IconImageAsset.chat,
                    badgeValue: "۳۴",
                    text: "پیام های من",
                  ),
                  _buildDivider(),
                  MenuItem(
                    icon: IconImageAsset.ads,
                    text: "آگهی های من",
                  ),
                  _buildDivider(),
                  MenuItem(
                    icon: IconImageAsset.article,
                    text: "مقالات",
                    badgeValue: "۲",
                  ),
                  _buildDivider(),
                  MenuItem(
                    icon: IconImageAsset.support,
                    text: "تماس با ما",
                  ),
                  _buildDivider(),
                  MenuItem(
                    icon: IconImageAsset.gears,
                    text: "تنظیمات",
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
