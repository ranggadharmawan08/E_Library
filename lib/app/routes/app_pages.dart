import 'package:get/get.dart';

import '../modules/detail_buku/bindings/detail_buku_binding.dart';
import '../modules/detail_buku/views/detail_buku_view.dart';
import '../modules/favorit/bindings/favorit_binding.dart';
import '../modules/favorit/views/favorit_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/pencarian/bindings/pencarian_binding.dart';
import '../modules/pencarian/views/pencarian_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';
import '../modules/tambah_buku/bindings/tambah_buku_binding.dart';
import '../modules/tambah_buku/views/tambah_buku_view.dart';
import '../modules/ubah_buku/bindings/ubah_buku_binding.dart';
import '../modules/ubah_buku/views/ubah_buku_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PENCARIAN,
      page: () => const PencarianView(),
      binding: PencarianBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_BUKU,
      page: () => const TambahBukuView(),
      binding: TambahBukuBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BUKU,
      page: () => const DetailBukuView(),
      binding: DetailBukuBinding(),
    ),
    GetPage(
      name: _Paths.UBAH_BUKU,
      page: () => const UbahBukuView(),
      binding: UbahBukuBinding(),
    ),
    GetPage(
      name: _Paths.FAVORIT,
      page: () => const FavoritView(),
      binding: FavoritBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
  ];
}
