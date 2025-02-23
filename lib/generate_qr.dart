import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart'; // ✅ Import QR Generator

class GenerateQR extends StatefulWidget {
  @override
  _GenerateQRState createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  TextEditingController textController = TextEditingController();
  String qrData = "Enter text to generate QR Code";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("🔳 QR Code Generator"),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: "Enter text",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  qrData = textController.text.isEmpty ? "Enter text to generate QR Code" : textController.text;
                });
              },
              child: Text("Generate QR Code"),
            ),
            SizedBox(height: 30),
            qrData != "Enter text to generate QR Code"
                ? QrImageView( // ✅ Use QrImage for QR generation
              data: qrData,
              version: QrVersions.auto,
              size: 200.0,
              backgroundColor: Colors.white,
            )
                : Text("Enter text to generate QR Code"),
          ],
        ),
      ),
    );
  }
}
