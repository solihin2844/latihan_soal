import 'package:get/get.dart';

import '../controllers/main_chat_controller.dart';

class MainChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainChatController>(
      () => MainChatController(),
    );
  }
}
