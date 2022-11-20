import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

typedef ItemCallback = Function(int posisi);

// ignore: must_be_immutable
class NavigasiBawah extends StatelessWidget {
  NavigasiBawah({Key? key, this.posisi = 0, required this.onItemClick})
      : super(key: key);

  int posisi;
  ItemCallback onItemClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              currentIndex: posisi,
              selectedItemColor: Colors.blueGrey,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                    activeIcon: Icon(
                      Icons.home_outlined,
                      size: 30,
                    )),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 30,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people),
                    label: 'Profile',
                    activeIcon: Icon(
                      Icons.person,
                      size: 30,
                    )),
              ],
              onTap: (int i) => onItemClick(i),
            ),
          ),
          Positioned(
            bottom: 0,
            height: 90,
            width: 140,
            child: Stack(alignment: AlignmentDirectional.topCenter, children: [
              InkWell(
                onTap: () => Get.toNamed(Routes.DISKUSI),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 4, bottom: 8),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: Color(0xFF3A7FD5),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x33000000),
                              offset: Offset(0, 6),
                            )
                          ],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check_circle_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Diskusi Soal',
                        style: TextStyle(color: Colors.black54, fontSize: 11),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
