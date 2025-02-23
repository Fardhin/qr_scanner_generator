import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'scan_qr.dart';
import 'generate_qr.dart';

void main() {
  runApp(QRApp());
}

class QRApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, // Dark mode enabled
        textTheme: GoogleFonts.poppinsTextTheme(), // Modern fonts
        useMaterial3: true, // Enables Material 3 design
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade800, Colors.blue.shade500],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "QR Code Scanner & Generator",
                style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              _buildButton(context, "📷 Scan QR Code", ScanQR()),
              SizedBox(height: 20),
              _buildButton(context, "🛠 Generate QR Code", GenerateQR()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget screen) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        textStyle: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen)),
      child: Text(text),
    );
  }
}
