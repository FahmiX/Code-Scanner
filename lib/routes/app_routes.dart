// ignore_for_file: unused_import

import 'package:flutter/material.dart';

// Page imports
import 'package:barcode_scanner/presentations/barcode_scanner/barcode_scanner_page.dart';
import 'package:barcode_scanner/presentations/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:barcode_scanner/presentations/barcode_scanner/views/barcode_scanner_view.dart';

// Routing
class AppRoutes {
  static const String bottomNavigationBar = "/bottomNavigationBar";
  static const String barcodeScanner = "/barcodeScanner";

  static Map<String, WidgetBuilder> routes = {
    bottomNavigationBar: (context) => const BottomNavigationBarView(),
    barcodeScanner: (context) => const BarcodeScannerView(),
  };
}
