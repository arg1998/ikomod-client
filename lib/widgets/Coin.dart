import 'package:flutter/material.dart';

class Coin extends StatelessWidget {
  final String coins;
  final double coinSize;
  final Widget trailing;
  final Color background;
  final Border border;
  final Padding padding;
  final double borderRadius;
  final double fontSize;

  const Coin({
    Key key,
    @required this.coins,
    this.coinSize,
    this.trailing,
    this.background,
    this.border,
    this.padding,
    this.borderRadius,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: background ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailing != null) trailing,
          SizedBox(width: 5),
          Text(
            coins,
            style: TextStyle(
              fontSize: fontSize ?? 15,
              fontFamily: "iransans",
              color: Color(0XFFff9500).withOpacity(0.9),
            ),
          ),
          SizedBox(width: 5),
          Image.asset(
            "assets/images/coin-small.png",
            height: coinSize ?? 25,
          ),
        ],
      ),
    );
  }
}
