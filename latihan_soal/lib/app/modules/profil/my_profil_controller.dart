import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:latihan_soal/app/modules/auth/auth_repository.dart';

import '../../data/models/user_model.dart';
import '../../routes/app_pages.dart';

class ProfilController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  AuthRepository authRepo;
  Rx<UserData?> userData = UserData().obs;
  ProfilController(this.authRepo);

  final RxBool _isSignOut = false.obs;

  bool get isLoadingSignOut => _isSignOut.value;

  @override
  Future<void> onInit() async {
    user = _auth.currentUser;
    if (user == null) {
      Get.offAllNamed(Routes.LOGIN);
    }
    userData.value = await authRepo.getUserByEmail(email: user?.email ?? '');

    update(['dataUser', 'dataProfil']);
    super.onInit();
  }

  Future<void> onLogout() async {
    _isSignOut.value = true;
    if (GoogleSignIn().currentUser != null) {
      await GoogleSignIn().signOut();
      await GoogleSignIn().disconnect();
    }
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
    _isSignOut.value = false;
    Get.offAllNamed(Routes.LOGIN);
  }
}
