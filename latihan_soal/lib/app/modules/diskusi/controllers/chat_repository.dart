import 'package:chat_page/chat_page.dart';

abstract class ChatRepositoryA {
  Future<List<ChatItem>> get messages;
}

class ChatRepository implements ChatRepositoryA {
  @override
  Future<List<ChatItem>> get messages async {
    final first = DateTime.now();
    final second = first.add(const Duration(minutes: -1));
    final third = second.add(const Duration(minutes: -1));
    final four = third.add(const Duration(minutes: -1));
    final five = four.add(const Duration(minutes: -1));
    final six = five.add(const Duration(minutes: -1));

    final messages = [
      ChatItem(
        content:
            'Halo, Perkenalkan saya Solihin yang akan menjadi pembimbing kalian di grub ini.',
        id: 1,
        name: 'Solihin',
        dateTime: six,
        isTutor: true,
      ),
      ChatItem(
        content: 'Baik Kak, terimakasih',
        id: 2,
        name: 'Saya',
        dateTime: five,
        isSender: true,
      ),
      ChatItem(
        content: 'Halo semua saya Andika dari SMAN 1 Palembang.',
        id: 3,
        name: 'Naufal',
        dateTime: four,
      ),
      ChatItem(
        content: 'Halo semua saya Andika dari SMAN 2 Baturaja.',
        id: 4,
        name: 'Bayu',
        dateTime: third,
      ),
      ChatItem(
        content: 'Halo semua saya Andika dari SMAN 3 OKU Selatan.',
        id: 5,
        name: 'Karina',
        dateTime: second,
      ),
      ChatItem(
        content: 'Halo semua saya Andika dari SMAN 4 Jayapura.',
        id: 6,
        name: 'Andy',
        dateTime: first,
      ),
      ChatItem(
          content:
              'Terima kasih kawan-kawan semua atas atensi dan perkenalan nya',
          id: 2,
          isSender: true,
          name: 'Saya',
          dateTime: DateTime.now())
    ];

    return messages;
  }
}
