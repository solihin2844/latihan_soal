import 'package:chat_page/app/modules/main_chat/controllers/main_chat_controller.dart';
import 'package:chat_page/app/modules/main_chat/views/main_chat_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konst_variabel/konst_variabel.dart';

class InputChatWidget extends GetView<MainChatController> {
  final ctrl = Get.find<MainChatController>();
  final SendCallback? onTapSend;
  InputChatWidget({super.key, this.onTapSend});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: warnaPutih,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(0.0, 0.0), // shadow direction: bottom right
          )
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: Icon(
              Icons.add,
              color: warnaPrimary,
            ),
          ),
          colSpace(6),
          Expanded(
            child: TextFormField(
              controller: ctrl.txtPesan,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              validator: ((value) {
                if (value!.isEmpty) {
                  return ("Silakan isi pesan");
                }
                return null;
              }),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                  suffixIcon: IconButton(
                    onPressed: () => ctrl.openCamera(),
                    icon: const Icon(Icons.camera_alt),
                    color: warnaPrimary,
                  ),
                  hintText: 'Ketuk untuk menulis...',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.amber, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(212, 221, 218, 218)))),
            ),
          ),
          IconButton(
              onPressed: () async {
                final chat = await ctrl.kirimPesan;
                await onTapSend?.call(chat!);

                Future.delayed(const Duration(milliseconds: 200),
                    () => ctrl.scrolToBottom());
              },
              icon: Icon(
                Icons.send,
                color: warnaPrimary,
              ))
        ],
      ),
    );
  }
}
