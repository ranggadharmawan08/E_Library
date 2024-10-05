import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController, // Menggunakan PageController dari controller
        children: [
          _buildPage(title: 'Welcome Screen'),
          _buildPage(title: 'Have Fun dan masuk'),
        ],
      ),
    );
  }

  Widget _buildPage({required String title}) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
