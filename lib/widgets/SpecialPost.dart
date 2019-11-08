import 'package:flutter/material.dart';
import 'package:ikomod/models/Post.model.dart';
import 'package:ikomod/widgets/ProfileImage.dart';

class SpecialPost extends StatelessWidget {
  final PostModel postData;

  const SpecialPost({
    Key key,
    this.postData,
  }) : super(key: key);

  Widget _buildProfileImage(BuildContext ctx) {
    return ProfileImage.fromUrl(
      url: postData.user.imageUrl,
      size: 45,
      margin: EdgeInsets.all(5),
      border: Border.all(
        width: 2,
        color: Theme.of(ctx).primaryColor,
      ),
    );
  }

  Widget _buildPostImage() {
    return Image.network(
      postData.imageUrls.first,
      fit: BoxFit.cover,
      alignment: Alignment.center,
    );
  }

  Widget _buildPostTitle(BuildContext ctx) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      color: Colors.black54,
      child: Text(
        postData.title,
        maxLines: 2,
        softWrap: true,
        overflow: TextOverflow.fade,
        style: Theme.of(ctx)
            .textTheme
            .subhead
            .copyWith(color: Colors.white, fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomLeft,
        children: [
          _buildPostImage(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileImage(context),
              Spacer(flex: 1),
              _buildPostTitle(context)
            ],
          )
        ],
      ),
    );
  }
}
