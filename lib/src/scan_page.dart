import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera_ml_vision/flutter_camera_ml_vision.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  bool resultSent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CameraMlVision<List<Barcode>>(
            detector: FirebaseVision.instance.barcodeDetector().detectInImage,
            onResult: (List<Barcode> barcodes) {
              if (!mounted || resultSent) {
                return;
              }
              resultSent = true;
              Navigator.of(context).pop<Barcode>(barcodes.first);
            },
          ),
        ),
      ),
    );
  }
}
