import 'package:chat_page/app/data/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MainChatController extends GetxController {
  RxList<ChatItem> isiPesan = <ChatItem>[].obs;
  final txtPesan = TextEditingController();
  ScrollController listScrollController = ScrollController();
  final _isLoadingMessages = false.obs;
  final ImagePicker _picker = ImagePicker();
  final _selectedFile = Rx<XFile?>(null);

  bool get isLoadingMessages => _isLoadingMessages.value;

  void setLoadingMessages(value) {
    _isLoadingMessages.value = value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    if (listScrollController.hasClients) {
      final position = listScrollController.position.maxScrollExtent;
      listScrollController.animateTo(
        position,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
      );
    }
    super.onReady();
  }

  Future<ChatItem?> get kirimPesan async {
    int newId = isiPesan.length + 1;
    final chat = ChatItem(
        id: newId,
        name: "Saya",
        content: txtPesan.text,
        dateTime: DateTime.now(),
        isSender: true);
    isiPesan.add(chat);
    txtPesan.clear();
    return chat;
  }

  void scrolToBottom() {
    if (listScrollController.hasClients) {
      final position = listScrollController.position.maxScrollExtent;
      listScrollController.animateTo(
        position,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
      );
    }
  }

  Future<void> openCamera() async {
    final cameraFile = await _picker.pickImage(source: ImageSource.camera);
    _selectedFile.value = cameraFile;
  }
}
