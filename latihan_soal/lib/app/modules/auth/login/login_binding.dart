import 'package:get/get.dart';

import '../auth_repository.dart';
import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl());
    Get.put(
      LoginController(Get.find<AuthRepository>()),
    );
  }
}
