import 'package:get/get.dart';

import '../../auth/auth_repository.dart';
import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl());
    Get.put(
      SplashController(Get.find<AuthRepository>()),
    );
  }
}
