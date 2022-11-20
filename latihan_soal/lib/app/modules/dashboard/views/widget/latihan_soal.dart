import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konst_variabel/konst_variabel.dart';

import '../../controllers/latihan_soal_controller.dart';
import 'hasil_latihan.dart';

class LatihanSoalPage extends GetView<LatihanSoalController> {
  final ctrl = Get.put(LatihanSoalController());
  LatihanSoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Latihan Soal'),
          backgroundColor: Colors.blueGrey[400],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              color: Colors.grey[200],
              child: NavigasiSoal(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 2),
                child: ItemSoal(),
              ),
            ),
            rowSpace(8),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GetX<LatihanSoalController>(builder: (_) {
                    return Visibility(
                      visible: ctrl.nomorSoal.value > 1,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: ElevatedButton(
                        onPressed: () => ctrl.prevSoal(),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(Icons.skip_previous),
                              Text('Sebelumnya'),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  GetX<LatihanSoalController>(builder: (_) {
                    return Visibility(
                      visible: ctrl.nomorSoal.value < 10,
                      replacement: ElevatedButton(
                        onPressed: () => Get.bottomSheet(bottomDialog),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('Kumpulin'),
                              colSpace(4),
                              const Icon(Icons.queue_sharp),
                            ],
                          ),
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () => ctrl.nextSoal(),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text('Selanjutnya'),
                              Icon(Icons.skip_next),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            rowSpace(10)
          ],
        ),
      ),
    );
  }
}

class ItemSoal extends GetView<LatihanSoalController> {
  final ctrl = Get.put(LatihanSoalController());
  ItemSoal({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text('Soal Nomor 1'),
        rowSpace(8),
        const Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
          textAlign: TextAlign.justify,
        ),
        rowSpace(20),
        pilihanJawaban(1, 'A. To amuse the readers with Yogyakarta'),
        pilihanJawaban(2, 'B. To describe the location of Yogyakarta'),
        pilihanJawaban(3, 'C. To persuade the readers to go to Yogyakarta'),
        pilihanJawaban(4, 'D. To promote Yogyakarta as tourist destination'),
        pilihanJawaban(5, 'E. To tell the readers the history of Yogyakarta'),
      ],
    );
  }

  InkWell pilihanJawaban(pilihan, text) {
    return InkWell(
      onTap: () => Get.find<LatihanSoalController>().ubahPilihan(pilihan),
      child: GetX<LatihanSoalController>(
        builder: (_) => Card(
          margin: const EdgeInsets.fromLTRB(0, 6, 0, 6),
          color: ctrl.jawaban.value == pilihan ? warnaPrimary : warnaPutih,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                text,
                style: TextStyle(
                    color:
                        ctrl.jawaban.value == pilihan ? warnaPutih : warnaHitam,
                    fontSize: 12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavigasiSoal extends GetView<LatihanSoalController> {
  final ctrl = Get.put(LatihanSoalController());
  NavigasiSoal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) => itemNavigasiSoal(nomor: index + 1),
      itemCount: 10,
      separatorBuilder: (_, int index) {
        return colSpace(5);
      },
    );
  }

  InkWell itemNavigasiSoal({nomor}) {
    return InkWell(
      child: Obx(
        () => Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(),
              shape: BoxShape.circle,
              color: nomor <= ctrl.nomorSoal.value ? warnaPrimary : warnaPutih),
          child: Center(
              child: Text(
            nomor.toString(),
            style: TextStyle(
                color: nomor <= ctrl.nomorSoal.value ? warnaPutih : warnaHitam),
          )),
        ),
      ),
    );
  }
}

Widget bottomDialog = SafeArea(
  child: Wrap(
    children: [
      Container(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: warnaPutih,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: 90,
                height: 6,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ),
              Image.asset(
                'assets/pelajaran/kumpulin.png',
                width: double.infinity,
              ),
              rowSpace(20),
              Text(
                'Kumpulkan latihan soal sekarang?',
                style: heading6,
              ),
              const Text('Boleh langsung kumpulin dong'),
              rowSpace(12),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () => Get.back(),
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.resolveWith(
                            (states) => const Size(150, 30)),
                        side: MaterialStateProperty.resolveWith(
                            (states) => BorderSide(color: warnaPrimary))),
                    child: const Text('Nanti dulu'),
                  ),
                  ElevatedButton(
                    onPressed: () => Get.to(const HasilLatihan()),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.resolveWith(
                          (states) => const Size(130, 28)),
                    ),
                    child: const Text('Ya'),
                  )
                ],
              ),
              rowSpace(20)
            ],
          ),
        ),
      )
    ],
  ),
);
