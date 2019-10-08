import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:ikomod/widgets/HeadLine.dart';

class FilterCategoriesHorizontalList extends StatelessWidget {
  final double height;
  final Widget child;

  const FilterCategoriesHorizontalList({
    Key key,
    this.height,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverStickyHeader(
        height: height ?? 150,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              HeadLine(
                lineColor: Colors.transparent,
                text: "سایر آگهی ها",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverStickyHeader extends SliverPersistentHeaderDelegate {
  _SliverStickyHeader({
    @required this.height,
    @required this.child,
  });
  final double height;
  final Widget child;
  @override
  double get minExtent => height;
  @override
  double get maxExtent => height;
  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverStickyHeader oldDelegate) {
    return child != oldDelegate.child;
  }
}
