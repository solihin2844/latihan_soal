import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:latihan_soal/app/modules/dashboard/views/dashboard_view.dart';
import 'package:latihan_soal/app/modules/diskusi/views/halaman_diskusi.dart';
import 'package:latihan_soal/app/modules/profil/views/my_profil_page.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final page = 0.obs;

  void ubahPage(newPage) => page.value = newPage;
  List<Widget> listPage = [DashboardView(), HalamanDiskusi(), MyProfile()];

  List<String> pageTitles = ['Dashboard', 'Diskusi Soal', 'Akun Saya'];
}
