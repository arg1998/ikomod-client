import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math' as math;

class PostManagementScreen extends StatelessWidget {
  static const routeName = "/postmanagement";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("آگهی جدید"),
          backgroundColor: Colors.blueAccent),
      body: new Container(
        // color: Colors.yellowAccent,
        padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
        height: double.infinity,
        child: new StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 2,
              // color: Colors.amberAccent,
              child: new InkWell(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        child: Image.network(
                          'https://picsum.photos/250?random=${math.Random().nextInt(20)}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Text(
                        'شلوار',
                        style: TextStyle(
                          fontSize: 22,
                        ),

                        // textDirection: TextDirection.rtl,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          staggeredTileBuilder: (int index) {
            return StaggeredTile.count(2, 3);
          },
        ),
      ),
    );
  }
}
