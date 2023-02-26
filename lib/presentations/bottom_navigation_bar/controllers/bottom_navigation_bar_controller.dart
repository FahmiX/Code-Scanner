// file: bottom_navigation_bar_controller.dart
import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  // Index
  var index = 0.obs;

  // Getters
  int getIndex() => index.value;

  // Setters
  void setIndex(int value) => index.value = value;
}
