import 'package:get/get.dart';

import '../controllers/ubah_buku_controller.dart';

class UbahBukuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UbahBukuController>(
      () => UbahBukuController(),
    );
  }
}
