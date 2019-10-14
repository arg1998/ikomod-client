import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  final String text;

  const CategoryItem({Key key, this.text}) : super(key: key);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem>
    with SingleTickerProviderStateMixin {
  AnimationController _animController;
  Animation<double> _scaleAnim;
  Animation<double> _fadeAnim;
  Animation<double> _shadowAnim;

  @override
  void initState() {
    super.initState();
    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _scaleAnim = Tween<double>(begin: 1, end: 0.95).animate(_animController);
    _fadeAnim = Tween<double>(begin: 1, end: 0.9).animate(_animController);
    _shadowAnim = Tween<double>(begin: 1, end: 0).animate(_animController);

    _animController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _animController.forward().whenComplete(_animController.reverse);
      },
      onTap: () {},
      child: Transform.scale(
        scale: _scaleAnim.value,
        child: Opacity(
          opacity: _fadeAnim.value,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(1, 2),
                    spreadRadius: _shadowAnim.value)
              ],
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                widget.text,
                style: Theme.of(context).textTheme.subhead.copyWith(
                    color: Colors.white,
                    fontFamily: "bkoodak",
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
