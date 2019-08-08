import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraView extends StatefulWidget {
  final bool disabled;
  final int cameraIndex;

  const CameraView({
    Key key,
    this.cameraIndex = 0,
    this.disabled = false,
  }) : super(key: key);

  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with SingleTickerProviderStateMixin {
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  int _cameraIndex = 0;

  void initCamera(int index) async {
    final cameras = await availableCameras();
    if (cameras.length <= index) {
      return;
    }

    final camera = cameras[index];
    _controller = CameraController(camera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.disabled) {
      return Container(color: Colors.grey.shade300);
    }

    if (_cameraIndex != widget.cameraIndex) {
      _cameraIndex = widget.cameraIndex;
      initCamera(_cameraIndex);
    }

    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CameraPreview(_controller);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
