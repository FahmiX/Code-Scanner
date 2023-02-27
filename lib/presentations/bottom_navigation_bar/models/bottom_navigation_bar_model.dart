import 'package:barcode_scanner/presentations/barcode_scanner/views/barcode_scanner_view.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarModel {
  // Icons
  final List<IconData> icons = [
    Icons.home,
    Icons.search,
    Icons.storage,
    Icons.person,
  ];

  // Pages
  final List<Widget> pages = [
    // Home
    Container(
      color: Colors.red,
    ),
    // Search
    Container(
      color: Colors.green,
    ),
    // Storage
    Container(
      color: Colors.blue,
    ),
    // Profile
    Container(
      color: Colors.yellow,
    ),
    // QR Code Scanner
    const BarcodeScannerView(),
  ];
}
