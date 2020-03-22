import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

class CameraApp extends StatefulWidget {
  final List<CameraDescription> cameras;

  CameraApp(this.cameras);

  @override
  _CameraAppState createState() => _CameraAppState(cameras);
}

class _CameraAppState extends State<CameraApp> {
  final List<CameraDescription> cameras;
  CameraController controller;

  _CameraAppState(this.cameras);

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final path = join(
              // Store the picture in the temp directory.
              // Find the temp directory using the `path_provider` plugin.
                (await getTemporaryDirectory()).path,
            '${DateTime.now()}.png',
            );

            // Attempt to take a picture and log where it's been saved.
            await controller.takePicture(path);
//            (Application.command..context = context).sendPhotoResponse(path);
          },
          child: Icon(Icons.camera, size: 20.0, color: Colors.black,),
          backgroundColor: Colors.white,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(margin: EdgeInsets.all(0.0),
        child: CameraPreview(controller)
      )
      );


  }
}
