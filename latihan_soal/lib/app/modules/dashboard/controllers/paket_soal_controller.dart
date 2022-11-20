import 'package:get/get.dart';
import 'package:latihan_soal/app/data/models/mata_pelajaran.dart';
import 'package:latihan_soal/app/data/models/paket_soal.dart';
import 'package:latihan_soal/app/modules/dashboard/repo/repo_pelajaran.dart';
import 'package:latihan_soal/app/modules/dashboard/views/widget/paket_none.dart';

class PaketSoalController extends GetxController {
  RxList<PaketSoal?>? listPaket = <PaketSoal>[].obs;
  String namaPelajaran = "";
  final PelajaranRepository _pelajaranRepository = PelajaranRepository();
  final _isLoadingPage = false.obs;

  bool get isLoadingPage => _isLoadingPage.value;

  @override
  Future<void> onInit() async {
    final pelajaran = Get.arguments as MataPelajaran;
    _isLoadingPage.value = true;
    namaPelajaran = pelajaran.courseName!;
    listPaket?.value =
        (await _pelajaranRepository.paketsoal(pelajaran.courseId!))!;
    _isLoadingPage.value = false;
    if (listPaket!.isEmpty) {
      Get.off(() => PaketKosongPage(), arguments: namaPelajaran);
    }
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    update(['namaPelajaran']);
    super.onReady();
  }
}
