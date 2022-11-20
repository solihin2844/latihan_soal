import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:konst_variabel/konst_variabel.dart';
import 'package:latihan_soal/app/modules/auth/auth_repository.dart';
import 'package:latihan_soal/app/modules/dashboard/views/widget/banner_pelajaran.dart';
import 'package:latihan_soal/app/modules/dashboard/views/widget/daftar_pelajaran.dart';
import 'package:latihan_soal/app/modules/profil/my_profil_controller.dart';

import '../../home/views/util_widget/loading.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  DashboardController ctrl1 = Get.put(DashboardController());
  ProfilController ctrl2 =
      Get.put(ProfilController(Get.find<AuthRepository>()));
  DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: ListView(
            children: [
              GetBuilder<ProfilController>(
                  id: 'dataUser',
                  builder: (_) {
                    return ListTile(
                      title: Text(
                        'Hai, ${ctrl2.user!.displayName ?? 'User'}',
                        style:
                            text12Black.copyWith(fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        'Selamat Datang',
                        style: text12Black,
                      ),
                      trailing: ClipRRect(
                        borderRadius: BorderRadius.circular(36),
                        child: ExtendedImage.network(
                          ctrl2.user!.photoURL!,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          cache: true,
                        ),
                      ),
                    );
                  }),
              Container(
                height: 147,
                width: Get.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  image: DecorationImage(
                      image: AssetImage('assets/logo/gambarsoal.png'),
                      fit: BoxFit.cover),
                ),
              ),
              rowSpace(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pilih Pelajaran',
                    style: text16Black.copyWith(fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                    child: Text(
                      'Lihat Semua',
                      style: text10Putih.copyWith(color: Colors.blue),
                    ),
                    onTap: () => controller.lihatSemuaPelajaran(),
                  ),
                ],
              ),
              rowSpace(20),
              GetBuilder<DashboardController>(
                id: 'listPelajaran',
                builder: (_) => ctrl1.isLoadingPage
                    ? buildLoading(context)
                    : Column(children: [
                        for (int i = 0;
                            i <
                                ((ctrl1.listPelajaran!.length > 3)
                                    ? 3
                                    : ctrl1.listPelajaran!.length);
                            i++)
                          DaftarPelajaran(
                            pelajaran: ctrl1.listPelajaran!.elementAt(i),
                          ),
                      ]),
              ),
              rowSpace(20),
              Row(
                children: const [
                  Text(
                    'Terbaru',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              rowSpace(8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    PelajaranTerbaru(posisi: 1),
                    PelajaranTerbaru(posisi: 2),
                    PelajaranTerbaru(posisi: 3),
                    PelajaranTerbaru(posisi: 4)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
