import 'package:get/get.dart';
import 'package:latihan_soal/app/modules/auth/auth_repository.dart';
import 'package:latihan_soal/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:latihan_soal/app/modules/diskusi/controllers/diskusi_controller.dart';
import 'package:latihan_soal/app/modules/profil/my_profil_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<DiskusiController>(() => DiskusiController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    //Get.put(DashboardController());
    //Get.put(ProfilController());
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl());
    Get.lazyPut<ProfilController>(
        () => ProfilController(Get.find<AuthRepository>()));
  }
}
