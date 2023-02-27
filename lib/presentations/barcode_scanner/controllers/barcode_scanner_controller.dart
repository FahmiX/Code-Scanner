import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

// Model
import '../models/barcode_scanner_model.dart';

class BarcodeScannerController {
  late BarcodeScannerModel _model;

  BarcodeScannerController() {
    _model = Get.put(BarcodeScannerModel());
  }

  Future<String> scanBarcode() async {
    String barcodeData = await FlutterBarcodeScanner.scanBarcode(
      "#ff6666",
      "Cancel",
      true,
      ScanMode.BARCODE,
    );
    _model.setBarcodeData(barcodeData);
    return barcodeData;
  }

  String getBarcodeData() {
    return _model.getBarcodeData();
  }
}
