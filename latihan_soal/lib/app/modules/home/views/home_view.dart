import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'util_widget/bottom_navi.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: GetX<HomeController>(
          builder: (_) => controller.listPage.elementAt(controller.page.value)),
      bottomNavigationBar: GetX<HomeController>(builder: (_) {
        return Visibility(
          visible: true,
          child: NavigasiBawah(
            posisi: controller.page.value,
            onItemClick: (posisi) => controller.ubahPage(posisi),
          ),
        );
      }),
    );
  }
}
