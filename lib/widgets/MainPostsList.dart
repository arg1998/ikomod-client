import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ikomod/models/Post.model.dart';
import 'package:ikomod/utils/Types.dart';
import 'package:ikomod/widgets/PostItem.dart';
import '../FAKE_DATA/FakePostData.dart' as FAKE_DATA;

class MainPostsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverStaggeredGrid.countBuilder(
      crossAxisCount: 4,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      itemCount: FAKE_DATA.homePosts.length,
      itemBuilder: (ctx, index) {
        return Container(
            padding: EdgeInsets.only(right: 3, left: 3, top: 3, bottom: 5),
            child: PostItem(
              index: index,
              postData: FAKE_DATA.homePosts[index],
            ));
      },
      staggeredTileBuilder: (index) {
        PostModel _post = FAKE_DATA.homePosts[index];
        bool isIntermediate = _post.type == PostType.INTERMEDIARY;
        int cac = isIntermediate ? 4 : 2;
        return StaggeredTile.count(cac, 3);
      },
    );
  }
}
