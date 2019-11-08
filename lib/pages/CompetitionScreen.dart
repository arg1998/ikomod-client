import 'package:flutter/material.dart';
import 'package:ikomod/utils/ConvertToPersian.dart';
import 'package:ikomod/utils/CustomFontIcons.dart';
import 'package:ikomod/widgets/ProfileImage.dart';
import '../widgets/SplashButton.dart';

class CompetitionScreen extends StatelessWidget {
  static const routeName = "/competition";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double day = 12;
    double hour = 16;
    double minutes = 5;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("مسابقات"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // color: Colors.yellowAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // width: screenSize.width * 0.6,
              // height: screenSize.width * 0.6,
              constraints: BoxConstraints(
                maxWidth: screenSize.width * 0.55,
                minWidth: screenSize.width * 0.55,
                maxHeight: screenSize.width * 0.52,
                minHeight: screenSize.width * 0.52,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26, blurRadius: 8, spreadRadius: 5)
                ],
                shape: BoxShape.circle,
                color: Color.fromRGBO(255, 255, 51, 0.8),
                border:
                    Border.all(color: Theme.of(context).primaryColor, width: 2),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'اعلام نتایج مسابقات',
                    style: TextStyle(
                      fontFamily: 'dinar',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${toPersian(hour.toString()).replaceAll(RegExp('.۰'), "")} ساعت و  ${toPersian(day.toString()).replaceAll(RegExp('.۰'), "")} روز و ${toPersian(minutes.toString()).replaceAll(RegExp('.۰'), "")} ثانیه',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
              height: screenSize.width * 0.5,
              // color: Colors.red,
              child: Card(
                elevation: 5,
                margin: EdgeInsets.all(0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 12, left: 5, top: 5, bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              ProfileImage.fromUrl(
                                border:
                                    Border.all(color: Colors.pink, width: 1),
                                url: 'https://picsum.photos/150',
                                size: 45,
                                margin: EdgeInsets.all(0),
                              ),
                              SizedBox(width: 5),
                              Text(
                                'امیررضا قربانی',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'bkoodak',
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'دامن کوتاه مخمل',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              fontFamily: "bkoodak",
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                'دقایقی پیش',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  fontFamily: "bkoodak",
                                ),
                              ),
                              SizedBox(width: 50),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    '۲۸',
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                      fontFamily: "bkoodak",
                                    ),
                                  ),
                                  Icon(
                                    CustomFontIcons.heart,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        child: Image.network(
                          'https://picsum.photos/250',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 20),
                Expanded(
                  child: SplashButton(text: 'برنده ها', onPress: () {}),
                ),
                Spacer(),
                Expanded(
                  child: SplashButton(text: 'برتر ها', onPress: () {}),
                ),
                SizedBox(width: 20),
              ],
            )
          ],
        ),
      ),
    );
  }
}
