import 'package:chat_page/app/data/model/chat_model.dart';
import 'package:chat_page/app/util/chat_time.dart';
import 'package:flutter/material.dart';
import 'package:konst_variabel/konst_variabel.dart';

class ItemChatWidget extends StatelessWidget {
  const ItemChatWidget({super.key, this.chat, this.namePrev});

  final ChatItem? chat;
  final String? namePrev;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          chat!.isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        rowSpace(12),
        Visibility(
          visible: namePrev != chat!.name,
          child: Text(
            chat!.name,
            style: TextStyle(color: mappingNameColor(context)),
          ),
        ),
        Container(
          constraints: const BoxConstraints(
              maxHeight: double.infinity, minHeight: 30, maxWidth: 310),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: mappingCardColor(context),
              borderRadius: BorderRadius.only(
                  topRight: chat!.isSender
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                  bottomRight: const Radius.circular(12),
                  bottomLeft: const Radius.circular(12),
                  topLeft: chat!.isSender
                      ? const Radius.circular(12)
                      : const Radius.circular(0))),
          child: Text(
            chat!.content,
            style: TextStyle(color: chat!.isSender ? warnaPutih : warnaHitam),
          ),
        ),
        rowSpace(2),
        Text(
          chat!.dateTime.chatDateTime,
          style: text10Black.copyWith(color: const Color(0xFF979797)),
        ),
      ],
    );
  }

  Color mappingCardColor(BuildContext context) {
    if (chat!.isTutor) {
      return const Color(0xffE0F8FF);
    }

    if (chat!.isSender) {
      return const Color(0xff3A7FD5);
    }

    if (chat!.id.isEven) {
      return const Color(0xffEAE0FF);
    }

    if (chat!.id.isOdd) {
      return const Color(0xffFFDCDC);
    }

    return Colors.white;
  }

  Color mappingNameColor(BuildContext context) {
    if (chat!.isTutor) {
      return const Color(0xff00C4FF);
    }

    if (chat!.isSender) {
      return const Color(0xff03BDB9);
    }

    if (chat!.id.isEven) {
      return const Color(0xff5200FF);
    }

    if (chat!.id.isOdd) {
      return const Color(0xffFF0000);
    }

    return Colors.black;
  }
}
