import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konst_variabel/konst_variabel.dart';
import 'package:latihan_soal/app/modules/home/views/util_widget/loading.dart';
import 'package:latihan_soal/app/modules/profil/my_profil_controller.dart';
import 'package:profil_siswa/profil_siswa.dart';

class MyProfile extends GetView<ProfilController> {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size(Get.width, 190),
          child: AppBar(
            backgroundColor: Colors.blueGrey[300],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            title: Text(
              'Akun Saya',
              style: text20Putih.copyWith(fontWeight: FontWeight.w400),
            ),
            centerTitle: true,
            bottom: buildBottomAppBar(context),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: GetBuilder<ProfilController>(
                  id: 'dataProfil',
                  builder: (_) {
                    return ProfilView(
                      dataSiswa: ProfilSiswa(
                          fullName: controller.userData.value?.userName,
                          userEmail: controller.userData.value?.userEmail,
                          userGender: controller.userData.value?.userGender,
                          jenjang: controller.userData.value?.jenjang,
                          userAsalSekolah:
                              controller.userData.value?.userAsalSekolah),
                      onLogOutTap: () {
                        controller.onLogout();
                        return null;
                      },
                      onSaveChange: (value) async {
                        debugPrint(value.fullName);
                        return null;
                      },
                    );
                  }),
            ),
            GetX<ProfilController>(
              builder: (_) => controller.isLoadingSignOut
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildLoading(context),
                        colSpace(20),
                        Text(
                          'On Logout, please wait!!',
                          style: text10Black,
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
            rowSpace(30)
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget buildBottomAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(Get.width, 100),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: GetBuilder<ProfilController>(
          id: 'dataUser',
          builder: (_) => ListTile(
            title: Text(
              controller.user!.displayName ?? 'No Name',
              style: text20Putih,
            ),
            subtitle: Text(
              controller.user!.email ?? 'No Email',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(36),
              child: ExtendedImage.network(
                controller.user!.photoURL!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                cache: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
