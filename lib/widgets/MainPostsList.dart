import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ikomod/widgets/PostItem.dart';

class MainPostsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverStaggeredGrid.countBuilder(
      crossAxisCount: 4,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      itemCount: 40,
      itemBuilder: (ctx, index) {
        bool isCenter = (index + 1) % 5 == 0;

        return Container(
            padding: EdgeInsets.only(right: 3, left: 3, top: 3, bottom: 5),
            child: PostItem(
              index: index,
              isCentered: isCenter,
            ));
      },
      staggeredTileBuilder: (index) {
        bool isIntermediate = (index + 1) % 5 == 0;
        int cac = isIntermediate ? 4 : 2;
        return StaggeredTile.count(cac, 3);
      },
    );
  }
}
