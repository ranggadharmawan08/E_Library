import 'package:e_library/app/data/database_helper.dart';
import 'package:e_library/app/routes/app_pages.dart';
import 'package:get/get.dart';

class FavoritController extends GetxController {
  var selectedIndex = 0.obs;
  var bukuList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    fetchFavorites();
    super.onInit();
  }


  void fetchFavorites() async {
    var buku = await DatabaseHelper().getBukuList(); // Mengambil data buku dari database
    bukuList.assignAll(buku); // Memperbarui daftar buku reaktif
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.offNamed(Routes.HOME);
        break;
      case 1:
        Get.offNamed(Routes.PENCARIAN);
        break;
      case 2:
        break;
      case 3:
        Get.offNamed(Routes.PROFILE);
        break;
    }
  }
}
