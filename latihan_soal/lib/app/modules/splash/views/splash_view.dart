import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konst_variabel/konst_variabel.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warnaHitam,
      body: Center(
        child: Image.asset('assets/logo/logoro.png'),
      ),
    );
  }
}
