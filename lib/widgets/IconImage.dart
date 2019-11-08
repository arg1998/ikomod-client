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
  static IconImageAsset get bell =>
      IconImageAsset("assets/images/bell-small.png");
  static IconImageAsset get search =>
      IconImageAsset("assets/images/search-small.png");
  static IconImageAsset get filter =>
      IconImageAsset("assets/images/filter-small.png");
  static IconImageAsset get shopping =>
      IconImageAsset("assets/images/shopping-small.png");
  static IconImageAsset get ads =>
      IconImageAsset("assets/images/ads-small.png");
  static IconImageAsset get billboard =>
      IconImageAsset("assets/images/billboard-small.png");
  static IconImageAsset get camera =>
      IconImageAsset("assets/images/camera.png");
  static IconImageAsset get chat =>
      IconImageAsset("assets/images/chat-small.png");
  static IconImageAsset get gears =>
      IconImageAsset("assets/images/gears-small.png");
  static IconImageAsset get growth =>
      IconImageAsset("assets/images/growth-small.png");
  static IconImageAsset get article =>
      IconImageAsset("assets/images/book-small.png");
  static IconImageAsset get plus =>
      IconImageAsset("assets/images/plus-small.png");
  static IconImageAsset get support =>
      IconImageAsset("assets/images/support-small.png");
  static IconImageAsset get trophy =>
      IconImageAsset("assets/images/trophy-small.png");
  static IconImageAsset get cup =>
      IconImageAsset("assets/images/cup-large.png");
  static IconImageAsset get logo =>
      IconImageAsset("assets/images/splash_logo.png");

  static IconImageAsset get editSmall =>
      IconImageAsset("assets/images/edit-small.png");
  static IconImageAsset get editLarge =>
      IconImageAsset("assets/images/edit-large.png");
  static IconImageAsset get goldMedalSmall =>
      IconImageAsset("assets/images/medal-gold-small.png");
  static IconImageAsset get goldMedalLarge =>
      IconImageAsset("assets/images/medal-gold-large.png");

  static IconImageAsset get silverMedalSmall =>
      IconImageAsset("assets/images/medal-silver-small.png");
  static IconImageAsset get silverMedalLarge =>
      IconImageAsset("assets/images/medal-silver-large.png");

  static IconImageAsset get bronzeMedalSmall =>
      IconImageAsset("assets/images/medal-bronze-small.png");
  static IconImageAsset get bronzeMedalLarge =>
      IconImageAsset("assets/images/medal-bronze-large.png");

  static IconImageAsset get gallerySmall =>
      IconImageAsset("assets/images/gallery-small.png");
  static IconImageAsset get galleryLarge =>
      IconImageAsset("assets/images/gallery-large.png");
}
