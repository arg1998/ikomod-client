import 'package:flutter/material.dart';
import 'package:ikomod/utils/CustomFontIcons.dart';
import 'package:ikomod/widgets/ProfileImage.dart';

class PostItem extends StatelessWidget {
  final bool isCentered;
  final int index;

  const PostItem({Key key, this.isCentered, this.index}) : super(key: key);

  Widget buildCenterdWidget(Widget child) {
    return Row(
      children: [
        Spacer(),
        Expanded(
          flex: 2,
          child: child,
        ),
        Spacer()
      ],
    );
  }

  Widget builPostItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Card(
            margin: EdgeInsets.all(0),
            elevation: 6,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    child: Row(
                      children: <Widget>[
                        ProfileImage.fromUrl(
                          url: "https://picsum.photos/60/60?random=$index",
                          size: 40,
                          border: Border.all(color: Colors.yellow, width: 4),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text("امیررضا قربانی"),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Image.network(
                      "https://picsum.photos/150?random=${index * 3.5}",
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "۴۵۰۰۰ تومان",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                fontFamily: "bkoodak",
                              ),
                            ),
                            Spacer(),
                            Text(
                              "۵۶",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
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
                        Text(
                          "این یک متن ازمایشی است. برای دیدن بیشتر کلیک کنید.",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text("دقایقی پیش")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Theme.of(context).accentColor.withOpacity(0.4),
                highlightColor: Colors.black.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                onTap: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget postItem = builPostItem(context);

    if (isCentered) {
      return buildCenterdWidget(postItem);
    } else {
      return postItem;
    }
  }
}
