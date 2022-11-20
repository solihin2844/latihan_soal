import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konst_variabel/konst_variabel.dart';
import 'package:latihan_soal/app/modules/home/views/util_widget/loading.dart';

import '../../../../data/konstanta.dart';
import '../login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetX<LoginController>(
          builder: (_) => controller.isLoadingSignIn
              ? buildLoading(context)
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          color: warnaHitam,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 36),
                      Image.asset(
                        Asset.LOGO,
                        height: 200,
                      ),
                      const SizedBox(height: 60),
                      Text(
                        'Selamat Datang',
                        style: TextStyle(
                          color: warnaHitam,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Selamat Datang di Aplikasi Widya Edu Aplikasi Latihan dan Konsultasi Soal',
                        style: TextStyle(
                          color: warnaGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () => controller.googleSignIn(),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.teal),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: Image(
                                    image: AssetImage(Asset.GOOGLE),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text('Login With Google'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      InkWell(
                        onTap: () {},
                        child: Card(
                          elevation: 10,
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.apple_sharp,
                                  color: warnaPutih,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Login With Apple ID',
                                  style: TextStyle(color: warnaPutih),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
