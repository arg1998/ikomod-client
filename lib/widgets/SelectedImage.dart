import 'package:flutter/material.dart';
import 'package:ikomod/utils/Types.dart';
import 'package:image_picker_flutter/image_picker_flutter.dart';

class SelectedImage extends StatelessWidget {
  final double aspectRatio;
  final AssetData image;
  final SelectionCallback onRemove;
  final int index;
  final ImageType imageType;

  const SelectedImage({
    Key key,
    @required this.aspectRatio,
    @required this.image,
    @required this.index,
    this.onRemove,
    this.imageType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            SizedBox.expand(
              child: Card(
                elevation: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetDataImage(image),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                onRemove(index, imageType);
              },
              child: Container(
                margin: EdgeInsets.only(top: 10, right: 10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red, width: 2),
                ),
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
