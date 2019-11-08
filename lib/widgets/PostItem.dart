import 'package:flutter/material.dart';
import 'package:ikomod/models/Post.model.dart';
import 'package:ikomod/utils/CustomFontIcons.dart';
import 'package:ikomod/utils/Helpers.dart';
import 'package:ikomod/utils/Types.dart';
import 'package:ikomod/widgets/IconImage.dart';
import 'package:ikomod/widgets/ProfileImage.dart';

class PostItem extends StatelessWidget {
  final int index;
  final PostModel postData;
  final double _profileImageSize = 40;
  final double _medalSize = 30;

  const PostItem({
    Key key,
    this.index,
    this.postData,
  }) : super(key: key);

  Widget _buildCenterdWidget(Widget child) {
    return Row(
      children: [
        Spacer(),
        Expanded(
          flex: 2,
          child: child,
        ),
        Spacer()
      ],
    );
  }

  List<Widget> _buildUserMedal() {
    if (postData.user.rank > 3) return [Spacer()];
    IconImageAsset medal;
    switch (postData.user.rank) {
      case 1:
        medal = IconImageAsset.goldMedalSmall;
        break;
      case 2:
        medal = IconImageAsset.silverMedalSmall;
        break;
      case 3:
        medal = IconImageAsset.bronzeMedalSmall;
        break;
    }

    return [
      Spacer(),
      Image.asset(
        medal.iconUrl,
        height: _medalSize,
        fit: BoxFit.cover,
      )
    ];
  }

  Widget _buildTopUserInfo(ThemeData appTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      child: Row(
        children: <Widget>[
          _buildProfileImage(appTheme),
          _buildUserName(),
        ]..addAll(_buildUserMedal()),
      ),
    );
  }

  Widget _buildProfileImage(ThemeData theme) {
    return ProfileImage.fromUrl(
      url: postData.user.imageUrl,
      size: _profileImageSize,
      border: Border.all(color: theme.primaryColor, width: 2),
    );
  }

  Widget _buildUserName() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Text(postData.user.name),
    );
  }

  Widget _buildPostImage() {
    return Expanded(
      child: Image.network(
        postData.imageUrls.first,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }

  Widget _buildPriceAndLikes() {
    String _price = intToPersian(postData.price);
    String _likes = intToPersian(postData.likes);
    return Row(
      children: [
        Text(
          "$_price تومان",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            fontFamily: "bkoodak",
          ),
        ),
        Spacer(),
        Text(
          _likes,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            fontFamily: "bkoodak",
          ),
        ),
        Icon(
          CustomFontIcons.heart,
          color: Colors.red,
          size: 20,
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      "این یک متن ازمایشی است. برای دیدن بیشتر کلیک کنید.",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }

  Widget _buildDate() {
    //TODO: fix date representation as string
    return Text("دقایقی پیش");
  }

  Widget _buildTapDetector(ThemeData appTheme) {
    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: appTheme.accentColor.withOpacity(0.4),
          highlightColor: Colors.black.withOpacity(0.2),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          onTap: () {
            //TODO: open the post in new page
          },
        ),
      ),
    );
  }

  Widget _builPostItem(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Card(
            margin: EdgeInsets.all(0),
            elevation: 6,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopUserInfo(appTheme),
                  _buildPostImage(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPriceAndLikes(),
                        _buildTitle(),
                        _buildDate(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          _buildTapDetector(appTheme),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget postItem = _builPostItem(context);

    if (postData.type == PostType.INTERMEDIARY) {
      return _buildCenterdWidget(postItem);
    } else {
      return postItem;
    }
  }
}
