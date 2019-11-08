import 'package:flutter/material.dart';
import 'package:ikomod/models/Post.model.dart';
import 'package:ikomod/widgets/HeadLine.dart';
import 'package:ikomod/widgets/SpecialPost.dart';

class SpecialPostList extends StatelessWidget {
  final double height;
  final List<PostModel> posts;
  final double itemWidth;
  final EdgeInsetsGeometry itemMargin;

  const SpecialPostList({
    Key key,
    this.height,
    this.posts,
    this.itemWidth,
    this.itemMargin,
  }) : super(key: key);

  Widget _buildListItem(BuildContext ctx, int index) {
    return Container(
      margin:
          itemMargin ?? EdgeInsets.only(left: 5, bottom: 15, right: 5, top: 0),
      width: itemWidth ?? MediaQuery.of(ctx).size * 0.8,
      height: double.infinity,
      child: Card(
        elevation: 8,
        child: SpecialPost(
          postData: posts[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          HeadLine(
            text: "آگهی های ویژه",
            textPadding: EdgeInsets.only(top: 5, right: 10, bottom: 5),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: _buildListItem,
              itemCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
