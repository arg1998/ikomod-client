import 'package:flutter/material.dart';
import 'package:ikomod/widgets/ProfileImage.dart';

class SpecialPost extends StatelessWidget {
  final String url;

  const SpecialPost({
    Key key,
    this.url,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomLeft,
        children: [
          Image.network(
            url,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileImage.fromUrl(
                url: "https://picsum.photos/80/80?random=6",
                size: 45,
                margin: EdgeInsets.all(5),
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                  
                ),
              ),
              Spacer(flex: 1),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                color: Colors.black54,
                child: Text(
                  "این یک متن آزمایشی است.این یک متن آزمایشی است",
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
