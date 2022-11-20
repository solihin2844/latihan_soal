import 'package:get/get.dart';

import '../auth_repository.dart';
import 'register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl());
    Get.put(RegisterController(Get.find<AuthRepository>()));
  }
}
