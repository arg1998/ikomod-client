import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 5),
              Text(
                "۲۳۵۰",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "iransans",
                    color: Color(0XFFff9500).withOpacity(0.9)),
              ),
              SizedBox(width: 5),
              Image.asset(
                "assets/images/coin-small.png",
                height: 25,
              ),
            ],
          ),
        ),
        Spacer(),
        Text("آی کمد"),
        Spacer(),
      ],
    );
  }
}