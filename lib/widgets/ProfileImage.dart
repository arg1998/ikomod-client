import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String url;
  final double size;
  final Border border;
  final EdgeInsets margin;

  ProfileImage.fromUrl(
      {@required this.url, @required this.size, this.border, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: margin ?? EdgeInsets.all(2),
      decoration: BoxDecoration(border: border ?? null, shape: BoxShape.circle),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: Image.network(url),
      ),
    );
  }
}
