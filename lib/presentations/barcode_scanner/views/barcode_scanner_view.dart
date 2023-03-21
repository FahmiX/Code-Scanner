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
  String _responseMessage = "";
  String _jumlahBarang = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 140,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Jumlah Barang',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                onChanged: (value) {
                  setState(() {
                    _jumlahBarang = value;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                String barcodeData = await _controller.scanBarcode();

                if (barcodeData == "-1") {
                  setState(() {
                    _responseMessage = "";
                  });
                  return;
                } else {
                  // Post barcode data to server
                  final response = await http.post(
                    Uri.parse(
                        'http://192.168.100.4:8000/api/gudang/barang/tambah'),
                    body: {
                      'kode_barang': barcodeData,
                      'jumlah_barang': _jumlahBarang,
                    },
                  );

                  if (response.statusCode == 200) {
                    final data = jsonDecode(response.body);
                    setState(() {
                      _responseMessage = data['message'];
                    });
                  } else {
                    final data = jsonDecode(response.body);
                    setState(() {
                      _responseMessage = data['message'];
                    });
                  }
                }
              },
              child: const Text('Scan Supply'),
            ),
            Text(
              _responseMessage,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
