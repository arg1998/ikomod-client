import 'package:flutter/material.dart';
import 'package:ikomod/widgets/CategoryItem.dart';
import 'package:ikomod/widgets/HeadLine.dart';

class FilterCategoriesHorizontalList extends StatelessWidget {
  final double height;
  final Widget child;
  final List<String> _categories = const [
    "اکسسوری",
    "بلوز، شومیز و تیشرت",
    "پالتو،‌ کاپشن و سوییشرت",
    "شلوار و لگ",
    "کفش",
    "لباس ورزشی",
    "لباس زیر",
    "مانتو و رویه",
    "سیسمونی نوزاد",
    "لباس عروسی و نامزدی",
    "کت و دامن",
    "لباس و پیراهن مجلسی",
  ];

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
          padding: EdgeInsets.only(bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadLine(
                text: "سایر آگهی ها",
                textPadding: EdgeInsets.only(top: 10, right: 10),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (ctx, index) =>
                      CategoryItem(text: _categories[index]),
                ),
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
