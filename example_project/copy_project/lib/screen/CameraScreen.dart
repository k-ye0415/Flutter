import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  bool _isCameraInitialized = false;

  // List<CameraDescription> cameras = [];

  @override
  void initState() {
    super.initState();
    // initCamera();
    _initializeCamera();
  }

  // Future<void> initCamera() async {
  //   // Get list of available cameras
  //   cameras = await availableCameras();
  // }

  Future<void> _initializeCamera() async {
    _cameraController = CameraController(
      cameras[0], // Select the desired camera (e.g., front or back)
      ResolutionPreset.high,
    );
    await _cameraController.initialize();
    setState(() => _isCameraInitialized = true);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scale =
        1 / (_cameraController.value.aspectRatio * MediaQuery.of(context).size.aspectRatio);
    return Scaffold(
      body: _isCameraInitialized
          ? Transform.scale(
              scale: scale, child: CameraPreview(_cameraController)) // Displays the camera preview
          : Center(child: CircularProgressIndicator()),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final image = await _cameraController.takePicture();
      //     print("Image path: ${image.path}");
      //   },
      //   child: Icon(Icons.camera),
      // ),
    );
  }
}
