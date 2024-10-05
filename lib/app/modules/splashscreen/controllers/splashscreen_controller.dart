import 'dart:async';
import 'package:e_library/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SplashscreenController extends GetxController {
  late PageController pageController;
  late Timer timer;

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi PageController
    pageController = PageController();

    // Mengatur timer untuk menggulir otomatis
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageController.page?.round() == 1) {
        // Jika sudah di halaman terakhir, navigasi ke Home
        Get.offAllNamed(Routes.HOME); // Ganti dengan nama route halaman Home Anda
        timer.cancel(); // Hentikan timer
      } else {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void onClose() {
    // Pastikan untuk membatalkan timer saat controller ditutup
    timer.cancel();
    pageController.dispose();
    super.onClose();
  }
}
