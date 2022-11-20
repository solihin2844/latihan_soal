import 'package:chat_page/chat_page.dart';
import 'package:get/get.dart';

import 'chat_repository.dart';

class DiskusiController extends GetxController {
  final _isLoadingMessages = true.obs;
  bool get isLoadingMessages => _isLoadingMessages.value;
  RxList<ChatItem> isiPesan = <ChatItem>[].obs;
  final ChatRepository _chatRepository = ChatRepository();
  @override
  Future<void> onInit() async {
    isiPesan.value = await _chatRepository.messages;
    await Future.delayed(const Duration(seconds: 2));
    _isLoadingMessages.value = false;
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }
}
