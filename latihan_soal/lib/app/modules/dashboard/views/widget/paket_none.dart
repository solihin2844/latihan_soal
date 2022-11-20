import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konst_variabel/konst_variabel.dart';

class PaketKosongPage extends GetView {
  final String namPelajaran = Get.arguments;
  static const String routeName = '/paket_none';
  PaketKosongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          namPelajaran,
          style: text18Putih,
        ),
        backgroundColor: Colors.blueGrey[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Paket Soal Tidak Tersedia',
              style: text12Black,
            ),
            Column(
              children: [
                rowSpace(150),
                Image.asset(
                  'assets/pelajaran/illustrasi.png',
                  width: 267,
                  height: 200,
                ),
                Text(
                  'Ya, Paket Tidak Tersedia',
                  style: heading2,
                ),
                Text(
                  'Tenang masih banyak yang bisa kamu pelajari',
                  style: text14Black,
                ),
                Text(
                  'Cari lagi yuk!',
                  style: text14Black,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
