import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_soal/app/data/models/user_model.dart';

import '../../../routes/app_pages.dart';
import '../auth_repository.dart';

class RegisterController extends GetxController {
  final auth = FirebaseAuth.instance;
  final AuthRepository authRepository;
  final txtEmail = TextEditingController();
  final txtNamaSekolah = TextEditingController();
  final txtNama = TextEditingController();

  final RxBool _isSignup = false.obs;
  RxString gender = 'Laki-laki'.obs;
  RxString kelas = 'XI-IPA'.obs;

  bool get isLoadingRegister => _isSignup.value;

  RegisterController(this.authRepository);
  void handleGender(value) {
    gender.value = value;
  }

  void setKelas(value) {
    kelas.value = value;
  }

  Future<void> handleRegister() async {
    _isSignup.value = true;
    try {
      UserData userData = UserData(
          userName: txtNama.text,
          userEmail: txtEmail.text,
          userAsalSekolah: txtNamaSekolah.text,
          userGender: gender.value,
          kelas: kelas.value,
          userFoto: auth.currentUser!.photoURL);
      final register = await authRepository.registerUser(userBody: userData);
      if (register) {
        Get.offAllNamed(Routes.HOME);
      }
    } catch (e) {
      Get.defaultDialog(
          contentPadding: const EdgeInsets.all(20),
          title: 'Verifikasi Email',
          middleText: 'Verifikasi Telah Kami Kirim ke Email ${txtEmail.text}');
    } finally {
      _isSignup.value = false;
    }
  }

  Future<void> handleRegisterOld() async {
    _isSignup.value = true;
    try {
      Get.back();
      Get.defaultDialog(
          contentPadding: const EdgeInsets.all(20),
          title: 'Verifikasi Email',
          middleText: 'Verifikasi Telah Kami Kirim ke Email ${txtEmail.text}');
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      Get.defaultDialog(
          contentPadding: const EdgeInsets.all(20),
          title: 'Verifikasi Email',
          middleText: 'Email ${txtEmail.text} Sudah terdaftar');
    } finally {
      _isSignup.value = false;
    }
  }

  @override
  void onReady() {
    String? imel = auth.currentUser!.email;
    txtEmail.text = imel!;
    super.onReady();
  }
}
