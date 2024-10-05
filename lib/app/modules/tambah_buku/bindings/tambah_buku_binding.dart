import 'package:get/get.dart';

import '../controllers/tambah_buku_controller.dart';

class TambahBukuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahBukuController>(
      () => TambahBukuController(),
    );
  }
}
