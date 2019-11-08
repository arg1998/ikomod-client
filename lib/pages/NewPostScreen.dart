import 'package:flutter/material.dart';
import 'package:ikomod/widgets/AnimatedCircle.dart';
import 'package:ikomod/widgets/GallerySelectionPage.dart';
import 'package:image_picker_flutter/image_picker_flutter.dart';

class NewPostScreen extends StatefulWidget {
  static const routeName = "/newPost";

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  bool loaded = false;
  final pageViewController = PageController(initialPage: 0);
  int pageIndex = 0;
  final int numPages = 3;

  nextStep() {
    if (pageIndex == numPages - 1) return;
    setState(() {
      pageIndex++;
      pageViewController.animateToPage(
        pageIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  previousStep() {
    if (pageIndex == 0) return;

    setState(() {
      pageIndex--;
      pageViewController.animateToPage(
        pageIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  _onFirstPageCompelete(List<AssetData> images) {
    nextStep();
  }

  _buildPageIndicators() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Circle(
              radius: 8,
              isActive: pageIndex == 0,
            ),
            SizedBox(width: 10),
            Circle(
              radius: 8,
              isActive: pageIndex == 1,
            ),
            SizedBox(width: 10),
            Circle(
              radius: 8,
              isActive: pageIndex == 2,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("آگهی جدید"),
        centerTitle: true,
        bottom: _buildPageIndicators(),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: PageView(
          controller: pageViewController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            GallerySelectionPage(
              onNextStep: _onFirstPageCompelete,
            ),
            Placeholder(color: Colors.blue),
            Placeholder(color: Colors.green),
          ],
        ),
      ),
    );
  }
}
