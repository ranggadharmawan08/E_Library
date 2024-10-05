import 'package:e_library/app/data/database_helper.dart';
import 'package:get/get.dart';

class UbahBukuController extends GetxController {
  // Variabel untuk menyimpan data buku yang akan diubah
  var buku = <String, dynamic>{}.obs; 
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    // Mengambil data buku dari argumen GetX
    if (Get.arguments != null && Get.arguments is Map) {
      buku.value = Map<String, dynamic>.from(Get.arguments); // Konversi ke Map<String, dynamic>
    }
  }

  // Fungsi untuk memperbarui data buku
  Future<void> updateBuku() async {
    if (buku['id'] != null) {
      // Pastikan untuk menggunakan buku.value saat mengupdate
      await _databaseHelper.updateBuku(buku.toMap());
      Get.back(); // Kembali ke halaman sebelumnya setelah berhasil memperbarui
    }
  }
}

extension RxMapExtensions on RxMap<String, dynamic> {
  Map<String, dynamic> toMap() {
    return Map<String, dynamic>.from(this);
  }
}
