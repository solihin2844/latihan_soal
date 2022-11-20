import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konst_variabel/konst_variabel.dart';
import 'package:latihan_soal/app/modules/dashboard/controllers/paket_soal_controller.dart';
import 'package:latihan_soal/app/modules/home/views/util_widget/loading.dart';

import '../../../../data/models/paket_soal.dart';
import 'latihan_soal.dart';

class PaketSoalPage extends GetView<PaketSoalController> {
  const PaketSoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 70),
        child: AppBar(
          title: GetBuilder<PaketSoalController>(
              id: 'namaPelajaran',
              builder: (_) {
                return Text(
                  controller.namaPelajaran,
                  style: text18Putih.copyWith(fontWeight: FontWeight.w700),
                );
              }),
          backgroundColor: Colors.blueGrey[400],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih Paket Soal',
              style: heading5,
            ),
            rowSpace(8),
            Expanded(
              child: SizedBox(
                height: Get.height,
                width: Get.width,
                child: GetX<PaketSoalController>(
                  builder: (_) => controller.isLoadingPage
                      ? buildLoading(context)
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1.2),
                          itemBuilder: ((_, index) => PaketSoalCard(
                              itemPaket:
                                  controller.listPaket?.elementAt(index))),
                          itemCount: controller.listPaket?.length,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaketSoalCard extends GetView {
  final PaketSoal? itemPaket;
  const PaketSoalCard({super.key, this.itemPaket});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(LatihanSoalPage()),
      child: Card(
        elevation: 10,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 36,
                height: 36,
                child: Center(
                    child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xFFF3F7F8),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Image(
                    image:
                        NetworkImage(itemPaket!.icon ?? 'assets/logo/edit.png'),
                  ),
                )),
              ),
              rowSpace(12),
              Text(
                itemPaket!.exerciseTitle!,
                style: heading12,
              ),
              rowSpace(4),
              Text(
                '${itemPaket!.jumlahDone}/${itemPaket!.jumlahSoal} Soal',
                style: text10Black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
