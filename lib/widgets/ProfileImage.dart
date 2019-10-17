import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' show sin, cos, pi;

class ProfileImage extends StatelessWidget {
  final String url;
  final double size;
  final Border border;
  final EdgeInsets margin;
  final showBadges;
  final List<ProfileBadge> badges;
  final EdgeInsets padding;
  final bool _isAsset;
  final BoxFit imageFitMode;

  const ProfileImage.fromUrl({
    @required this.url,
    @required this.size,
    this.border,
    this.margin,
    this.showBadges = false,
    this.padding = const EdgeInsets.all(0),
    this.badges = const [],
    this.imageFitMode = BoxFit.cover,
  }) : _isAsset = false;

  const ProfileImage.fromAssets({
    @required this.url,
    @required this.size,
    this.border,
    this.margin,
    this.showBadges = false,
    this.padding = const EdgeInsets.all(0),
    this.badges = const [],
    this.imageFitMode = BoxFit.cover,
  }) : _isAsset = true;

  @override
  Widget build(BuildContext context) {
    Iterable<Widget> badgeWidgets = [];

    if (showBadges && badges.length > 0) {
      final double borderSize = (border != null) ? border.bottom.width : 0;
      badgeWidgets = badges?.map((b) {
        final Point loc = b.getLocation(size);
        return Positioned(
          top: loc.y - borderSize,
          left: loc.x - borderSize,
          child: SizedBox(
            height: b.height,
            width: b.width,
            child: b.child,
          ),
        );
      });
    }

    return Padding(
      padding: padding,
      child: Container(
        width: size,
        height: size,
        margin: margin,
        decoration: BoxDecoration(
          border: border,
          shape: BoxShape.circle,
        ),
        child: Stack(
          // fit: StackFit.expand,
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(size / 2),
              child: _isAsset
                  ? Image.asset(
                      url,
                      fit: imageFitMode,
                    )
                  : Image.network(url, fit: imageFitMode),
            ),
          ]..addAll(badgeWidgets),
        ),
      ),
    );
  }
}

class ProfileBadge {
  final Widget child;
  final double height;
  final double width;
  final double angle;
  final Offset offset;
  final double radiusOffset;

  ProfileBadge({
    @required this.child,
    @required this.height,
    @required this.width,
    this.angle = 0,
    this.radiusOffset = 0,
    this.offset = const Offset(0, 0),
  });

  ProfileBadge.square({
    @required this.child,
    @required double size,
    this.angle = 0,
    this.radiusOffset = 0,
    this.offset = const Offset(0, 0),
  })  : height = size,
        width = size;

  Point getLocation(double parentRadius) {
    final r = parentRadius / 2 + radiusOffset;
    final y = sin(angle);
    final x = cos(angle);

    final left = r + (r * x) - (width / 2) + offset.dx;
    final top = r - (y * r) - (height / 2) + offset.dy;

    return Point(left, top);
  }
}
