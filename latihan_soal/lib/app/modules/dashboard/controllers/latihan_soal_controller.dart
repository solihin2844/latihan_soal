import 'package:get/get.dart';

class LatihanSoalController extends GetxController {
  RxInt jawaban = 0.obs;
  RxInt nomorSoal = 1.obs;

  void ubahPilihan(value) {
    jawaban.value = value;
  }

  void nextSoal() => nomorSoal.value++;

  void prevSoal() => nomorSoal.value--;
}
