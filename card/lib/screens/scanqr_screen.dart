import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScanner extends StatefulWidget {
  @override
  _QRCodeScannerState createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  late CameraController _controller;
  late List<CameraDescription> cameras;
  late QRViewController _qrViewController;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    await _controller.initialize();

    setState(() {
      // Ensure that the _controller is initialized before using it
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Scanner"),
      ),
      body: Stack(
        children: [
          if (_controller != null && _controller.value.isInitialized)
            CameraPreview(_controller),
          QRView(
            key: _qrKey,
            onQRViewCreated: (controller) {
              _qrViewController = controller;
              _qrViewController.scannedDataStream.listen((scanData) {
                print("Scanned Data: $scanData");
              });
            },
          ),
          Center(
            child: Container(
              width: 200.0, // задайте ширину рамки
              height: 200.0, // задайте высоту рамки
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _qrViewController.dispose();
    super.dispose();
  }
}
