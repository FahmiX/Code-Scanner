// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () async {
                String barcodeData = await _controller.scanBarcode();

                if (barcodeData == "-1") {
                  setState(() {
                    _barcodeData = "";
                  });
                  return;
                } else {
                  // Post barcode data to server
                  final response = await http.post(
                    Uri.parse('http://192.168.42.10:3000/api/transaction/buy'),
                    body: {'kode_barang': barcodeData},
                  );

                  if (response.statusCode == 200) {
                    final data = jsonDecode(response.body);
                    setState(() {
                      _barcodeData = data['message'];
                    });
                  } else {
                    final data = jsonDecode(response.body);
                    setState(() {
                      _barcodeData = data['message'];
                    });
                  }
                }
              },
              child: const Text('Scan Barcode'),
            ),
          ],
        ),
      ),
    );
  }
}
