import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../data/models/user_model.dart';
import '../../../routes/app_pages.dart';
import '../auth_repository.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository;

  final auth = FirebaseAuth.instance;
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();
  RxBool isSignup = false.obs;
  RxBool _isSignIn = false.obs;

  RxBool passwordVisible = false.obs;

  bool get isLoadingSignIn => _isSignIn.value;

  LoginController(this.authRepository);
  void togglePassword() {
    passwordVisible.value = !passwordVisible.value;
  }

  Future<void> googleSignIn() async {
    _isSignIn.value = true;
    GoogleSignInAccount? account = await GoogleSignIn().signIn();
    if (account != null) {
      GoogleSignInAuthentication gauth = await account.authentication;
      OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: gauth.accessToken, idToken: gauth.idToken);
      await auth.signInWithCredential(credential);

      await isUserRegistered();
      //Get.offAllNamed(Routes.HOME);
    }
  }

  Future<void> handleSignUp() async {
    isSignup.value = true;
    try {
      UserCredential userLogin = await auth.createUserWithEmailAndPassword(
          email: txtEmail.text, password: txtPassword.text);
      await userLogin.user!.sendEmailVerification();
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
      isSignup.value = false;
    }
  }

  Future<void> handleSignIn() async {
    _isSignIn.value = true;
    try {
      UserCredential userLogin = await auth.signInWithEmailAndPassword(
          email: txtEmail.text, password: txtPassword.text);
      if (userLogin.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
            contentPadding: const EdgeInsets.all(20),
            title: 'Verifikasi Email',
            middleText: 'Email ${txtEmail.text} Belum tervirifikasi');
      }
    } on FirebaseAuthException catch (error) {
      if (kDebugMode) {
        debugPrint(error.code);
      }
      Get.defaultDialog(
          contentPadding: const EdgeInsets.all(20),
          title: 'Verifikasi Email',
          middleText:
              'Email ${txtEmail.text} Tidak ditemukan atau password salah!!!');
    } finally {
      _isSignIn.value = false;
    }
  }

  Future<void> isUserRegistered() async {
    String? email = auth.currentUser?.email;
    if (email != null) {
      UserData? userData = await authRepository.getUserByEmail(email: email);
      if (userData != null) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.REGISTER);
      }
    } else {
      _isSignIn.value = false;
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  @override
  void onClose() {}
}
