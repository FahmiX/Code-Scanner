// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

// Controller
import '../controllers/barcode_scanner_controller.dart';
// Model
import '../models/barcode_scanner_model.dart';

class BarcodeScannerView extends StatefulWidget {
  const BarcodeScannerView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BarcodeViewState();
}

class _BarcodeViewState extends State<BarcodeScannerView> {
  final BarcodeScannerController _controller = BarcodeScannerController();
  String _barcodeData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Barcode Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _barcodeData,
              style: const TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () async {
                String barcodeData = await _controller.scanBarcode();
                setState(() {
                  _barcodeData = barcodeData;
                });
              },
              child: const Text('Scan Barcode'),
            ),
          ],
        ),
      ),
    );
  }
}
