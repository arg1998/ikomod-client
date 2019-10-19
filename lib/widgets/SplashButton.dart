import 'package:flutter/material.dart';

class SplashButton extends StatelessWidget {
  final String text;
  final Function onPress;

  const SplashButton({Key key, this.text, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: Theme.of(context).primaryColor,
      shadowColor: Colors.black,
      elevation: 5,
      child: InkWell(
        highlightColor: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: 'dinar'),
            ),
          ),
        ),
        onTap: onPress,
      ),
    );
  }
}
