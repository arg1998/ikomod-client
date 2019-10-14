import 'package:flutter/material.dart';

class SplashButton extends StatelessWidget {
  final String text;
  final Function onPress;

  const SplashButton({Key key, this.text, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
      color: Color.fromRGBO(1, 42, 54, 0.7),
      child: InkWell(
        highlightColor: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        onTap: onPress,
      ),
    );
  }
}
