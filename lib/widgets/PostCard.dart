import 'package:flutter/material.dart';
import 'package:ikomod/utils/CustomFontIcons.dart';

class PostCard extends StatelessWidget {
  final double cardWidth;
  final double aspectRatio;
  final EdgeInsets margin;
  final bool hasCardWith;
  final Icon icon;
  final Widget child;

  const PostCard({
    Key key,
    this.cardWidth,
    this.aspectRatio,
    this.margin,
    this.icon,
    this.child,
    this.hasCardWith,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth ?? double.infinity,
      child: Card(
        elevation: 2,
        margin: margin ?? EdgeInsets.all(0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            hasCardWith
                ? ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    child: Image.network(
                      'https://picsum.photos/250',
                      fit: BoxFit.cover,
                    ),
                  )
                : Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      child: Image.network(
                        'https://picsum.photos/250',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        ' ۴۵۰۰۰ تومان',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          fontFamily: "bkoodak",
                        ),
                      ),
                      Spacer(flex: 1),
                      Text(
                        '۲۰',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          fontFamily: "bkoodak",
                        ),
                      ),
                      Icon(
                        CustomFontIcons.heart,
                        color: Colors.red,
                        size: 20,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'این آگهی آزمایشی است.',
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      fontFamily: "bkoodak",
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'دقایقی پیش',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      fontFamily: "bkoodak",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
