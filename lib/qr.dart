import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({super.key});

  @override
  State<QrCodeScanner> createState() => _QrState();
}

class _QrState extends State<QrCodeScanner> {
  final MobileScannerController controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: controller,
      onDetect: (BarcodeCapture capture) {
        final List<Barcode> barcodes = capture.barcodes;

        if (barcodes.length > 0) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: Text(barcodes[0].rawValue!),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('Dismiss'),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}