import 'package:e_library/app/data/database_helper.dart';
import 'package:get/get.dart';

class DetailBukuController extends GetxController {
  var buku = {}.obs; // Variabel buku akan menggunakan Map<String, dynamic>
  final DatabaseHelper _databaseHelper = DatabaseHelper(); // Instance DatabaseHelper

  @override
  void onInit() {
    super.onInit();
    // Periksa apakah Get.arguments berisi data yang sesuai
    if (Get.arguments != null && Get.arguments is Map<String, dynamic>) {
      buku.value = Get.arguments as Map<String, dynamic>;
    } else {
      // Jika data tidak ditemukan, berikan default atau peringatan
      buku.value = {
        'id': 0,
        'nama': 'Buku tidak ditemukan',
        'deskripsi': 'Deskripsi tidak tersedia',
        'filePath': '',
        'isLoved': 0, // Default nilai isLoved
      };
    }
  }

  void toggleLove() async {
  if (buku['id'] != 0) {
    // Buat salinan dari map agar bisa dimodifikasi
    final updatedBuku = Map<String, dynamic>.from(buku);

    // Toggle status love
    updatedBuku['isLoved'] = updatedBuku['isLoved'] == 1 ? 0 : 1;

    // Update status love di database
    await _databaseHelper.updateLoveStatus(updatedBuku['id'], updatedBuku['isLoved']);

    // Assign kembali nilai buku setelah diubah
    buku.value = updatedBuku;
  }
}

}
