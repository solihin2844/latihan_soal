import 'package:chat_page/app/data/model/chat_model.dart';
import 'package:chat_page/app/modules/main_chat/views/widget/item_chat.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_chat_controller.dart';
import 'widget/input_chat.dart';

typedef SendCallback = Future<String?>? Function(ChatItem chat);

class MainChatPage<C extends MainChatController> extends GetView<C> {
  final MainChatController ctrl = Get.put(MainChatController());
  final SendCallback? onTapSend;
  final List<ChatItem>? listChat;

  MainChatPage({Key? key, this.onTapSend, this.listChat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ctrl.isiPesan.value = listChat!;
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: buildBody(context),
      bottomNavigationBar: buildBottom(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Obx(() {
      if (controller.isLoadingMessages) {
        return buildLoading(context);
      }

      return buildData(context);
    });
  }

  Widget buildLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }

  Widget buildData(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: GetX<MainChatController>(
        builder: (_) => ListView.builder(
          controller: controller.listScrollController,
          itemBuilder: ((_, index) => ItemChatWidget(
                chat: controller.isiPesan.elementAt(index),
                namePrev: index == 0
                    ? 'NO'
                    : controller.isiPesan.elementAt(index - 1).name,
              )),
          itemCount: controller.isiPesan.length,
        ),
      ),
    );
  }

  Widget buildBottom(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return InputChatWidget(onTapSend: onTapSend);
  }
}
