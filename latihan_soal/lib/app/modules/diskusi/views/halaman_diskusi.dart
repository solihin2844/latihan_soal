import 'package:chat_page/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_soal/app/modules/diskusi/controllers/diskusi_controller.dart';

import '../../home/views/util_widget/loading.dart';

class HalamanDiskusi extends GetView<DiskusiController> {
  HalamanDiskusi({
    Key? key,
  }) : super(key: key);

  final DiskusiController ctrl = Get.find<DiskusiController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFE5E5E5),
        appBar: PreferredSize(
          preferredSize: Size(Get.width, 70),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blueGrey[300],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            title: const Text('Diskusi Soal'),
            centerTitle: true,
          ),
        ),
        body: Obx(
          () {
            if (ctrl.isLoadingMessages) {
              return buildLoading(context);
            }

            return MainChatPage(
              onTapSend: (chat) async {
                debugPrint(chat.toString());
                return null;
              },
              listChat: ctrl.isiPesan,
            );
          },
        ),
      ),
    );
  }
}
