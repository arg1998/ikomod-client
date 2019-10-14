import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

class FilterModal extends StatelessWidget {
  final Size screenSize;

  const FilterModal({Key key, this.screenSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Container(
              width: screenSize.width * 0.75,
              height: screenSize.height * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(screenSize.width * 0.15),
                  topRight: Radius.circular(3),
                  bottomLeft: Radius.circular(3),
                  bottomRight: Radius.circular(screenSize.width * 0.15),
                ),
              ),
              child: Center(
                child: Text(
                  "FILTERS",
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
            ),
          )),
    );
  }
}
