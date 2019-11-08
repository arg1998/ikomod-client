import 'package:flutter/material.dart';
import 'package:ikomod/pages/CameraFeed.dart';
import 'package:ikomod/utils/Types.dart';
import 'package:ikomod/widgets/SelectedImage.dart';
import 'package:image_picker_flutter/image_picker_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'GalleryThumb.dart';
import 'IconImage.dart';

// first page of the NewPostScreen in PageView
class GallerySelectionPage extends StatefulWidget {
  final Function onNextStep;
  final Function onCancel;
  const GallerySelectionPage({
    Key key,
    this.onCancel,
    this.onNextStep,
  }) : super(key: key);

  @override
  _GallerySelectionPageState createState() => _GallerySelectionPageState();
}

class _GallerySelectionPageState extends State<GallerySelectionPage> {
  // list of images fetched from gallery by image_picker_flutter
  List<AssetData> _images = [];
  // this map holds the indeces of selected images from the list above and which type it is (CAMERA or GALLERY)
  Map<int, ImageType> _selectedIndeces = {};
  // holds the number of currrently selected images
  int _numSelected = 0;
  final int _maxSelection = 4;
  //TODO: implement this for slower devices and show a loading screen before the gridview becomes available
  bool loaded = false;

  /// when an image thumbnail gets tapped inside the gridview and in the selected images preview list
  void onImageTapped(int index, ImageType imageType) {
    // fetching the index in the _selectedIndeces map
    ImageType selectionStatus = _selectedIndeces[index];
    //check if this image is selected before
    if (selectionStatus != null) {
      //remove the image
      setState(() {
        _selectedIndeces.remove(index);
        if (imageType == ImageType.CAMERA) {
          _images.removeAt(index);
        }
        _numSelected--;
      });
    } else if (_numSelected < _maxSelection) {
      // add image
      setState(() {
        _selectedIndeces[index] = ImageType.GALLERY;
        _numSelected++;
      });
    }
  }

  void loadImages() async {
    var data = await Utils.getImages(ImagePickerType.onlyImage);
    setState(() {
      _images = data;
      loaded = true;
    });
  }

  void _addCameraImage(AssetData camImage) {
    // 1) add this image to the list of gallery images
    // 1-1) add the image to the list
    _images.add(camImage);
    // 1-2) find an index for this image
    int index = _images.length - 1;
    // add the index of the newly adde image to the selected indeces
    setState(() {
      _selectedIndeces[index] = ImageType.CAMERA;
      _numSelected++;
    });
  }

  @override
  void initState() {
    PermissionHandler().requestPermissions([
      PermissionGroup.storage,
      PermissionGroup.camera,
    ]).then((permissions) {
      if (permissions[PermissionGroup.camera] == PermissionStatus.granted &&
          permissions[PermissionGroup.storage] == PermissionStatus.granted) {
        loadImages();
      } else {
        Navigator.pop(context);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _images.clear();
    _images = null;
    _selectedIndeces.clear();
    _selectedIndeces = null;
    _numSelected = 0;
    Utils.cancelAll();
    super.dispose();
  }

  Widget _buildSelectionPreviewList() {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _selectedIndeces.keys.map((index) {
              final AssetData image = _images[index];
              return SelectedImage(
                image: image,
                aspectRatio: image.width / image.height,
                index: index,
                onRemove: onImageTapped,
                imageType: _selectedIndeces[index],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildMiddleControlArea() {
    bool canSelect = _numSelected != _maxSelection;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: Colors.black26,
            offset: const Offset(2, -2),
            spreadRadius: 1.5,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCameraIcon(canSelect),
          _buildRemainingImages(),
          _buildGalleryIcon(canSelect),
        ],
      ),
    );
  }

  Widget _buildGalleryGridView() {
    return Expanded(
      flex: 2,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: _images.length,
        itemBuilder: (_, index) {
          return GalleryImageThumb(
            key: Key(_images[index].name),
            isSelected: _selectedIndeces[index] != null,
            image: _images[index],
            index: index,
            onTap: onImageTapped,
            size: 100,
          );
        },
      ),
    );
  }

  Widget _buildCameraIcon(bool canSelect) {
    if (canSelect) {
      return GestureDetector(
        child: Image(
          image: AssetImage(IconImageAsset.camera.iconUrl),
          width: 40,
        ),
        onTap: () async {
          final cameraImage = await Navigator.of(context).pushNamed(
            CameraFeed.routeName,
          ) as AssetData;

          if (cameraImage != null) {
            _addCameraImage(cameraImage);
          }
        },
      );
    } else {
      return Image(
        image: AssetImage(IconImageAsset.camera.iconUrl),
        width: 40,
      );
    }
  }

  Widget _buildGalleryIcon(bool canSelect) {
    if (canSelect) {
      return GestureDetector(
          child: Image(
            image: AssetImage(IconImageAsset.gallerySmall.iconUrl),
            width: 40,
          ),
          onTap: () {
            ImagePicker.mulPicker(context,
                appBarColor: Theme.of(context).primaryColor,
                type: ImagePickerType.onlyImage,
                limit: _maxSelection - _numSelected,
                mulCallback: _galleryPickerCallback);
          });
    } else {
      return Image(
        image: AssetImage(IconImageAsset.gallerySmall.iconUrl),
        width: 40,
      );
    }
  }

  Widget _buildRemainingImages() {
    return Text(
      "${_numSelected} / $_maxSelection",
      style: TextStyle(
        color: Colors.white,
        fontFamily: "dinar",
        fontSize: 20,
      ),
      textDirection: TextDirection.ltr,
    );
  }

  void _galleryPickerCallback(List<AssetData> images) {
    if (images.length == 0) return;
    int len = _images.length;
    _images.addAll(images);
    for (int i = len; i < len + images.length; i++) {
      _selectedIndeces[i] = ImageType.GALLERY;
      _numSelected++;
    }
    setState(() {});
  }

  void _goToNextStep() {
    List<AssetData> images = [];
    _selectedIndeces.keys.map((index) {
      images.add(_images[index]);
    });

    widget.onNextStep(images);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSelectionPreviewList(),
        _buildMiddleControlArea(),
        _buildGalleryGridView(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RaisedButton(
              child: Text("بی خیال"),
              onPressed: null,
            ),
            RaisedButton(
              child: Text("بعدی"),
              onPressed: _goToNextStep,
            ),
          ],
        )
      ],
    );
  }
}
