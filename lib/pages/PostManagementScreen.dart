import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math' as math;

import 'package:ikomod/widgets/PostCard.dart';

class PostManagementScreen extends StatelessWidget {
  static const routeName = "/postmanagement";

  Widget _simplePupup() => PopupMenuButton<int>(
        icon: Icon(Icons.more_vert, color: Colors.red, size: 30),
        elevation: 2,
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            enabled: true,
            value: 1,
            child: Text(
              'اولین',
              style: TextStyle(color: Colors.black, fontFamily: 'dinar'),
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Text(
              'دومین',
              style: TextStyle(color: Colors.black, fontFamily: 'dinar'),
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("آگهی های من"),
      ),
      body: Container(
        // color: Colors.yellowAccent,
        padding: EdgeInsets.only(top: 20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.62,
          ),
          itemBuilder: (BuildContext context, int index) {
            return PostCard(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              hasCardWith: false,
              // popUpMenuButton: this._simplePupup(),
              // icon: Icon(
              //   Icons.more_vert,
              //   color: Colors.red,
              // ),
            );
          },
        ),
      ),
    );
  }
}
