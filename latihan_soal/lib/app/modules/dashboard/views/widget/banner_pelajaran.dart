import 'package:flutter/material.dart';

class PelajaranTerbaru extends StatelessWidget {
  final int posisi;
  const PelajaranTerbaru({super.key, required this.posisi});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 284,
      height: 146,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              'https://picsum.photos/300/200??random=$posisi',
            ),
            fit: BoxFit.cover),
      ),
      child: Stack(
        children: const [
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'Tutorial ..',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
