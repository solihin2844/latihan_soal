import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_soal/app/modules/dashboard/views/widget/daftar_pelajaran.dart';

import '../../home/views/util_widget/loading.dart';
import '../controllers/dashboard_controller.dart';

class PelajaranAllPage extends GetView<DashboardController> {
  final ctrl = Get.find<DashboardController>();
  PelajaranAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Semua Ebook'),
          backgroundColor: Colors.blueGrey[400],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: GetX<DashboardController>(
            builder: (_) => ctrl.isLoadingPage
                ? buildLoading(context)
                : ListView.builder(
                    itemBuilder: (_, index) => DaftarPelajaran(
                          pelajaran: controller.listPelajaran!.elementAt(index),
                        ),
                    itemCount: controller.listPelajaran!.length),
          ),
        ),
      ),
    );
  }
}
