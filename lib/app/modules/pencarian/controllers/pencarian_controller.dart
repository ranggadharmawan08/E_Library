import 'package:e_library/app/data/database_helper.dart';
import 'package:e_library/app/routes/app_pages.dart';
import 'package:get/get.dart';

class PencarianController extends GetxController {
  var selectedIndex = 1.obs; // 1 untuk posisi Search
  var searchResults = <Map<String, dynamic>>[].obs; // Hasil pencarian

  void onItemTapped(int index) {
    selectedIndex.value = index;

    switch (index) {
      case 0:
        Get.offNamed(Routes.HOME); // Navigasi ke HomeView
        break;
      case 1:
        break;
      case 2:
        Get.offNamed(Routes.FAVORIT); // Navigasi ke FavoriteView
        break;
      case 3:
        Get.offNamed(Routes.PROFILE); // Navigasi ke ProfileView
        break;
    }
  }

  // Fungsi untuk mencari buku berdasarkan nama
  void searchBuku(String name) async {
    final dbHelper = DatabaseHelper();
    searchResults.value = await dbHelper.searchBukuByName(name);
  }
}
