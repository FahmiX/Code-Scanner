import 'package:flutter/material.dart';

// Page imports
import 'package:barcode_scanner/presentations/barcode_scanner/barcode_scanner_page.dart';
import 'package:barcode_scanner/presentations/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';

// Routing
class AppRoutes {
  static const String barcodeScanner = '/barcode-scanner';
  static const String bottomNavigationBar = '/bottom-navigation-bar';

  static final Map<String, WidgetBuilder> routes = {
    // Barcode Scanner
    barcodeScanner: (context) => const BarcodeScannerPage(),

    // Bottom Navigation Bar
    bottomNavigationBar: (context) => BottomNavigationBarView(),
  };
}
