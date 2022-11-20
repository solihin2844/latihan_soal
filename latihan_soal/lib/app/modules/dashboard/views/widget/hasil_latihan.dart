import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konst_variabel/konst_variabel.dart';

class HasilLatihan extends StatelessWidget {
  const HasilLatihan({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: warnaPrimary,
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () => Get.until((route) => route.isFirst),
                    icon: Icon(
                      Icons.close,
                      color: warnaPutih,
                    ),
                    label: Text(
                      'Tutup',
                      style: TextStyle(color: warnaPutih),
                    ),
                  ),
                  const Expanded(child: SizedBox())
                ],
              ),
              rowSpace(40),
              Text(
                'Selamat',
                style: heading2.copyWith(color: warnaPutih),
              ),
              Text(
                'Kamu telah menyelesaikan kuiz ini',
                style: TextStyle(color: warnaPutih),
              ),
              rowSpace(30),
              Image.asset(
                'assets/pelajaran/piala.png',
                width: 173,
              ),
              rowSpace(20),
              Text(
                'Nilai kamu :',
                style: TextStyle(color: warnaPutih),
              ),
              rowSpace(12),
              Text(
                '100',
                style: TextStyle(color: warnaPutih, fontSize: 90),
              )
            ],
          ),
        ),
      ),
    );
  }
}
