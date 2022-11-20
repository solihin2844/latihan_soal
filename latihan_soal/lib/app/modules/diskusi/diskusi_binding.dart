import 'package:get/get.dart';
import 'package:latihan_soal/app/modules/diskusi/controllers/diskusi_controller.dart';

class DiskusiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiskusiController>(() => DiskusiController());
  }
}
