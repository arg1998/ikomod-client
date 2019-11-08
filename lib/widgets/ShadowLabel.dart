import 'package:flutter/material.dart';

class ShadowLabel extends StatelessWidget {
  final String number;

  ShadowLabel({Key key, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 30,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 2,
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(1, 2),
              spreadRadius: 2)
        ],
        color: Theme.of(context).primaryColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(
          Radius.elliptical(8, 8),
        ),
      ),
      child: Center(
        child: Text(
          number,
          style:
              TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'dinar'),
        ),
      ),
    );
  }
}
