import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import '../../models/therapist.dart';

class OnlineMeeting extends StatefulWidget {
  final Therapist therapist;

  const OnlineMeeting({Key? key, required this.therapist}) : super(key: key);

  @override
  State<OnlineMeeting> createState() => _OnlineMeetingState();
}

class _OnlineMeetingState extends State<OnlineMeeting> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
    );

    _controller = CameraController(
      frontCamera,
      ResolutionPreset.medium,
    );

    await _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Stack(
                  children: [
                    CameraPreview(_controller),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Image.asset(
                        widget.therapist.gender == 'Male'
                            ? 'lib/assets/img/therapist-2.jpg'
                            : 'lib/assets/img/therapist-1.png',
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      'Disconnect',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
