import 'package:flutter/material.dart';

class HeadLine extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry textPadding;
  final EdgeInsetsGeometry lineMargin;
  final Color lineColor;

  const HeadLine({
    Key key,
    @required this.text,
    this.textPadding,
    this.lineMargin,
    this.lineColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: textPadding ??
                const EdgeInsets.only(right: 10, bottom: 5, top: 5),
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline,
            ),
          ),
        ],
      ),
    );
  }
}
