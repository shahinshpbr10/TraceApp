import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:traceapp/Common/appcolor.dart';
import 'package:traceapp/Common/textstyles.dart';
import 'package:url_launcher/url_launcher.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _controller;
  String? _scannedData;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
    });

    _controller?.scannedDataStream.listen((scanData) {
      setState(() {
        _scannedData = scanData.code;
      });

      if (_scannedData != null) {
        _controller?.pauseCamera();
        _showScannedResultDialog(_scannedData!);
      }
    });
  }

  Future<void> _redirectToGooglePay(String paymentData) async {
    // GPay URI format for UPI
    final Uri gpayUri = Uri(
      scheme: 'upi',
      host: 'pay',
      queryParameters: {
        'pa': 'receiver-vpa@bank', // Replace with recipient's VPA (UPI ID)
        'pn': 'Receiver Name', // Replace with recipient's name
        'mc': '1234', // Merchant code (optional)
        'tid': 'txn123456789', // Transaction ID (optional)
        'tr': 'order12345', // Order reference (optional)
        'tn': 'Payment for order', // Transaction note
        'am': '10.00', // Amount to be paid
        'cu': 'INR', // Currency code
        'url': 'https://your-payment-website.com' // Payment website (optional)
      },
    );

    if (await canLaunchUrl(gpayUri)) {
      await launchUrl(gpayUri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Google Pay is not available')),
      );
    }
  }

  void _showScannedResultDialog(String scannedData) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("QR Code Scanned"),
        content: Text("Scanned Data: $scannedData"),
        actions: [
          TextButton(
            onPressed: () {
              _controller?.resumeCamera();
              Navigator.of(context).pop();
            },
            child: const Text("Scan Again"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await _redirectToGooglePay(scannedData);
            },
            child: const Text("Pay via GPay"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        title:  Text("QR Scanner",style:AppTextStyles.bodyText.copyWith(color: AppColors.white) ,),
        backgroundColor: AppColors.maincolor1,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              key: _qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.teal,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          ),
          if (_scannedData != null)
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'Last scanned: $_scannedData',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            )
        ],
      ),
    );
  }
}
