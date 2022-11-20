import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../data/models/user_model.dart';
import '../../../routes/app_pages.dart';
import '../../auth/auth_repository.dart';

class SplashController extends GetxController {
  final auth = FirebaseAuth.instance;
  final AuthRepository authRepository;

  SplashController(this.authRepository);
  @override
  void onInit() {
    Timer(const Duration(seconds: 1), () {
      isUserSignedIn();
    });
    super.onInit();
  }

  void isUserSignedIn() async {
    if (auth.currentUser == null) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      await isUserRegistered();
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
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
