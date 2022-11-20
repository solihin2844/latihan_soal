import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konst_variabel/konst_variabel.dart';
import 'package:latihan_soal/app/data/models/mata_pelajaran.dart';
import 'package:latihan_soal/app/modules/dashboard/controllers/dashboard_controller.dart';

class DaftarPelajaran extends StatelessWidget {
  final MataPelajaran? pelajaran;
  const DaftarPelajaran({
    super.key,
    this.pelajaran,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: () =>
            Get.find<DashboardController>().pilihPelajaran(pelajaran!.courseId),
        minLeadingWidth: 50,
        contentPadding: const EdgeInsets.all(12),
        leading: SizedBox(
          width: 53,
          height: 53,
          child: Center(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color(0xFFF3F7F8),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Image(
              image: NetworkImage(
                  pelajaran!.urlCover ?? 'assets/pelajaran/general.png'),
            ),
          )),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pelajaran!.courseName ?? 'Tidak Ada Pelajaran',
              style: text12Black.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              '${pelajaran!.jumlahDone}/${pelajaran!.jumlahMateri} Paket latihan soal',
              style: text12Black,
            ),
            rowSpace(4),
          ],
        ),
        subtitle: Container(
          height: 10,
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Stack(children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(45)),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: Container(
                width: (double.infinity),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(45)),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
