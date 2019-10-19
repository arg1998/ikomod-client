import 'package:flutter/material.dart';
import 'CustomLinePaint.dart';
import 'ProfileImage.dart';

class RanksPost extends StatelessWidget {
  final Text personNumber;
  final int rankNumber;

  const RanksPost({Key key, this.personNumber, this.rankNumber})
      : super(key: key);

  Border borderMaker() {
    int temporary = this.rankNumber;
    bool first = temporary == 1;
    const Color FirstColor = Colors.yellow;
    bool second = temporary == 2;
    const Color SecondColor = Color(0xFFC0C0C0);
    // bool third = temporary == 3;
    const Color ThirdColor = Color(0XFFCD7F32);
    if (first) {
      return Border.all(color: FirstColor, width: 2);
    } else if (second) {
      return Border.all(color: SecondColor, width: 2);
    } else {
      return Border.all(color: ThirdColor, width: 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(height: 20),
        personNumber,
        ProfileImage.fromUrl(
          border: borderMaker(),
          url: 'https://picsum.photos/150',
          size: 80,
          margin: EdgeInsets.all(0),
        ),
        Triangle(
          width: screenSize.width * 0.4,
          height: screenSize.width * 0.2,
          lineWidth: 3,
          lineColor: Colors.redAccent,
        ),
        Container(
          width: screenSize.width * 0.65,
          child: Card(
            elevation: 2,
            margin: EdgeInsets.all(0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    child: Image.network(
                      'https://picsum.photos/250',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SizedBox(
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('دقایقی پیش',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'ziba')),
                            Spacer(),
                            Text(
                              '۲۰',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'ziba',
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.adjust,
                              color: Theme.of(context).primaryColorDark,
                            )
                          ],
                        ),
                        Text(
                          'این آگهی آزمایشی است',
                          maxLines: 2,
                          style: TextStyle(fontSize: 20, fontFamily: 'ziba'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
