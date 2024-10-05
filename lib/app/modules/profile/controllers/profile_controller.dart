import 'package:e_library/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var selectedIndex = 0.obs;

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
        Get.offNamed(Routes.FAVORIT);
        break;
      case 3:
        break;
    }
  }
}
