import 'package:e_library/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:e_library/app/data/database_helper.dart'; // Import database helper

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  var bukuList = <Map<String, dynamic>>[].obs; // Daftar buku reaktif

  @override
  void onInit() {
    super.onInit();
    fetchBukuList(); // Memuat data buku saat controller diinisialisasi
  }

  void fetchBukuList() async {
    var buku = await DatabaseHelper().getBukuList(); // Mengambil data buku dari database
    bukuList.assignAll(buku); // Memperbarui daftar buku reaktif
  }

  void hapusBuku(int id) {
    // Temukan buku berdasarkan id dan hapus dari bukuList
    bukuList.removeWhere((buku) => buku['id'] == id); // Bandingkan id sebagai int
    // Simpan perubahan ke database jika diperlukan
    DatabaseHelper().deleteBuku(id); // Hapus dari database juga
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        break;
      case 1:
        Get.offNamed(Routes.PENCARIAN);
        break;
      case 2:
        Get.offNamed(Routes.FAVORIT);
        break;
      case 3:
        Get.offNamed(Routes.PROFILE);
        break;
    }
  }
}
