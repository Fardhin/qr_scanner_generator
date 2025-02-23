import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanQR extends StatefulWidget {
  @override
  _ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  String qrText = "Scan a QR Code";
  bool isFlashOn = false;
  MobileScannerController controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("📷 Scan QR Code")),
      body: Stack(
        alignment: Alignment.center,
        children: [
          MobileScanner(
            controller: controller,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              if (barcodes.isNotEmpty) {
                setState(() {
                  qrText = barcodes.first.rawValue ?? "No QR Found!";
                });
              }
            },
          ),
          Positioned(
            bottom: 80,
            child: Text(
              qrText,
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.blueAccent,
              child: Icon(isFlashOn ? Icons.flash_off : Icons.flash_on),
              onPressed: () {
                setState(() {
                  isFlashOn = !isFlashOn;
                  controller.toggleTorch();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
