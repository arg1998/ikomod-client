import 'package:flutter/material.dart';
import 'package:ikomod/utils/Types.dart';
import 'package:image_picker_flutter/image_picker_flutter.dart';

import 'IconImage.dart';

class GalleryImageThumb extends StatelessWidget {
  final BoxFit imageFit;
  final AssetData image;
  final SelectionCallback onTap;
  final int size;
  final int index;
  final bool isSelected;

  const GalleryImageThumb({
    Key key,
    @required this.image,
    @required this.index,
    this.imageFit = BoxFit.cover,
    this.isSelected = false,
    this.onTap,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key,
      onTap: onTap != null
          ? () {
              onTap(index, ImageType.GALLERY);
            }
          : null,
      child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              // border: isSelected
              //     ? null
              //     : Border.all(color: Theme.of(context).primaryColor, width: 1.5),
              ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.topRight,
            children: <Widget>[
              Positioned.fill(
                child: FadeInImage(
                  placeholder: AssetImage(IconImageAsset.logo.iconUrl),
                  fit: BoxFit.cover,
                  key: key,
                  image: AssetDataImage(
                    image,
                    targetHeight: size,
                    targetWidth: size,
                  ),
                ),
              ),
              if (isSelected)
                Positioned.fill(
                  child: Container(
                    color: Colors.black54,
                  ),
                ),
              if (isSelected)
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconImage(
                    margin: EdgeInsets.all(0),
                    icon: IconImageAsset.logo,
                    size: 30,
                  ),
                ),
            ],
          )),
    );
  }
}
