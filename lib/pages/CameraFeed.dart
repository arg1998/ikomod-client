import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker_flutter/image_picker_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../main.dart';

class CameraFeed extends StatefulWidget {
  static const routeName = "/cameraFeed";
  // max number of images which user is allowed to take from camera
  final int maxSelection;

  const CameraFeed({
    Key key,
    this.maxSelection,
  }) : super(key: key);

  @override
  _CameraFeedState createState() => _CameraFeedState();
}

class _CameraFeedState extends State<CameraFeed> {
  bool _cameraInitialized = false;
  CameraController _cameraController;
  Future<void> _cameraControllerInializer;
  AssetData cameraImage;
  Directory path;
  CameraException error;
  AudioCache shutterSound;

  @override
  void initState() {
    _cameraController = CameraController(
      camera,
      ResolutionPreset.veryHigh,
      enableAudio: false,
    );
    _initImageDirectory();
    _cameraControllerInializer = _cameraController.initialize();
    _cameraInitialized = true;

    //initialize the audio player
    shutterSound = AudioCache(prefix: 'sounds/');
    shutterSound.load("shutter.mp3");
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    shutterSound.clearCache();
    shutterSound = null;
    super.dispose();
  }

  void _initImageDirectory() async {
    // get external directory
    final ext = await getExternalStorageDirectory();
    //create the directories if not exist
    path = Directory("${ext.path}/Pictures");
    if (!path.existsSync()) {
      path.createSync();
    }
  }

  Future<void> _takePicture() async {
    //return if camera is taking picture
    if (_cameraController.value.isTakingPicture) return;

    //create a file name
    int imageName = DateTime.now().millisecondsSinceEpoch;
    final filePath = "${path.path}/$imageName.jpg";

    try {
      //play the shutter sound
      shutterSound.play("shutter.mp3");
      //save the image as a JPG file
      await _cameraController.takePicture(filePath);

      setState(() {
        cameraImage = AssetData.fromJson({
          "id": imageName.toString(),
          "name": '${imageName}.jpg',
          "path": filePath,
          "mimeType": "image",
          "time": imageName,
          "width": 1080,
          "height": 1920
        });
      });
    } on CameraException catch (e) {
      setState(() {
        error = e;
      });
    }
  }

  Future<void> _clearImage({bool rebuild = true}) async {
    if (cameraImage != null) {
      await File(cameraImage.path).delete();
      if (rebuild) {
        setState(() {
          cameraImage = null;
        });
      }
    }
  }

  Widget _buildCircleButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: CircleButton(
          onPresss: _takePicture,
          radius: 40.0,
          borderColor: Colors.white,
          backgroundColor: Colors.white54,
          borderWidth: 5,
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white54,
            width: 1,
          ),
        ),
        margin: EdgeInsets.only(left: 15, top: 40),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            textDirection: TextDirection.ltr,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop(null);
          },
        ),
      ),
    );
  }

  Widget _buildConditionalLayout() {
    if (cameraImage != null) {
      return Stack(
        fit: StackFit.expand,
        children: [
          // Image.file(, fit: BoxFit.cover),
          Image(image: AssetDataImage(cameraImage), fit: BoxFit.cover,),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Spacer(flex: 2),
                  // retry capturing image
                  CircleButton(
                    onPresss: _clearImage,
                    radius: 25,
                    borderColor: Colors.blue,
                    borderWidth: 2,
                    backgroundColor: Colors.blue.withOpacity(0.5),
                    child: Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  // Accept this image
                  CircleButton(
                    onPresss: () {
                      Navigator.of(context).pop(cameraImage);
                    },
                    radius: 40,
                    borderColor: Colors.green,
                    borderWidth: 4,
                    backgroundColor: Colors.green.withOpacity(0.6),
                    child: Icon(
                      Icons.done,
                      size: 50,
                      color: Colors.white70,
                    ),
                  ),
                  Spacer(),
                  // cancel capturing image
                  CircleButton(
                    onPresss: () async {
                      await _clearImage(rebuild: false);
                      Navigator.of(context).pop(null);
                    },
                    radius: 25,
                    borderColor: Colors.red,
                    borderWidth: 2,
                    backgroundColor: Colors.red.withOpacity(0.5),
                    child: Icon(
                      Icons.arrow_back,
                      textDirection: TextDirection.ltr,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(flex: 2),
                ],
              ),
            ),
          )
        ],
      );
    } else {
      return FutureBuilder<void>(
        future: _cameraControllerInializer,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _cameraController.value.aspectRatio,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CameraPreview(_cameraController),
                  _buildCircleButton(),
                  _buildBackButton(),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: _buildConditionalLayout(),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final Function onPresss;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final Widget child;
  final double radius;
  final EdgeInsets margin;

  const CircleButton({
    Key key,
    @required this.onPresss,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.white60,
    this.borderWidth = 1,
    this.radius = 10.0,
    this.margin = const EdgeInsets.all(0),
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPresss,
      child: Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        margin: margin,
        child: child,
      ),
    );
  }
}
