import 'package:flutter/material.dart';

class IconImage extends StatelessWidget {
  final EdgeInsets padding;
  final EdgeInsets margin;
  final IconImageAsset icon;
  final double size;
  final VoidCallback onTap;

  const IconImage(
      {Key key, this.padding, this.margin, this.icon, this.size, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      margin: margin,
      child: InkResponse(
        onTap: onTap,
        child: Image.asset(
          icon.iconUrl,
          fit: BoxFit.contain,
          height: size,
          width: size,
        ),
        focusColor: Theme.of(context).focusColor,
        hoverColor: Theme.of(context).hoverColor,
        highlightColor: Theme.of(context).highlightColor,
        splashColor: Theme.of(context).splashColor,
        radius: Material.defaultSplashRadius,
      ),
    );
  }
}

class IconImageAsset {
  final String _url;

  IconImageAsset(this._url);

  String get iconUrl => _url;

// list of all images in assets bundle
  static IconImageAsset get bell => IconImageAsset("assets/images/bell.png");
  static IconImageAsset get search =>
      IconImageAsset("assets/images/search.png");
  static IconImageAsset get filter =>
      IconImageAsset("assets/images/filter_1.png");
  static IconImageAsset get shopping =>
      IconImageAsset("assets/images/shopping.png");
  static IconImageAsset get ads => IconImageAsset("assets/images/ads.png");
  static IconImageAsset get billboard =>
      IconImageAsset("assets/images/billboard.png");
  static IconImageAsset get camera =>
      IconImageAsset("assets/images/camera.png");
  static IconImageAsset get chat => IconImageAsset("assets/images/chat.png");
  static IconImageAsset get gears => IconImageAsset("assets/images/gears.png");
  static IconImageAsset get growth =>
      IconImageAsset("assets/images/growth.png");
  static IconImageAsset get article =>
      IconImageAsset("assets/images/newspaper.png");
  static IconImageAsset get plus => IconImageAsset("assets/images/plus.png");
  static IconImageAsset get support =>
      IconImageAsset("assets/images/support.png");
  static IconImageAsset get trophy =>
      IconImageAsset("assets/images/trophy_1.png");
}
