// file: bottom_navigation_bar_view.dart
import "package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

// Controller
import '../controllers/bottom_navigation_bar_controller.dart';
// Model
import '../models/bottom_navigation_bar_model.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BottomNavigationBarState();
}

class BottomNavigationBarState extends State<BottomNavigationBarView> {
  late BottomNavigationBarController controller;
  late BottomNavigationBarModel model;

  @override
  void initState() {
    super.initState();
    controller = Get.put(BottomNavigationBarController());
    model = BottomNavigationBarModel();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Bottom Navigation Bar",
      home: SafeArea(
        child: Obx(() => Scaffold(
              body: model.pages[controller.getIndex()],
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.yellow,
                onPressed: () {
                  controller.setIndex(4);
                },
                child: const Icon(Icons.qr_code_scanner, color: Colors.black),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: AnimatedBottomNavigationBar(
                backgroundColor: Colors.black,
                inactiveColor: Colors.yellow,
                activeColor: Colors.white,
                gapLocation: GapLocation.center,
                notchSmoothness: NotchSmoothness.softEdge,
                icons: model.icons,
                activeIndex: controller.getIndex(),
                onTap: (index) => controller.setIndex(index),
              ),
            )),
      ),
    );
  }
}
