import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final bool isActive;
  final double radius;

  const Circle({Key key, this.isActive = false, this.radius = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      child: Center(
        child: AnimatedContainer(
          width: isActive ? radius * 1.5 : radius,
          height: isActive ? radius * 1.5 : radius,
          duration: Duration(milliseconds: 400),
          decoration: BoxDecoration(
            boxShadow: [
              if (isActive)
                BoxShadow(
                  color: Colors.white60,
                  blurRadius: 10,
                  spreadRadius: 1.2,
                  offset: const Offset(1, 1),
                )
            ],
            shape: BoxShape.circle,
            color: isActive ? Colors.white : Colors.white60,
          ),
        ),
      ),
    );
  }
}
