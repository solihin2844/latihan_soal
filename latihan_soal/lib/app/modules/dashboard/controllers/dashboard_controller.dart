import 'package:get/get.dart';
import 'package:latihan_soal/app/data/models/mata_pelajaran.dart';
import 'package:latihan_soal/app/modules/dashboard/controllers/paket_soal_controller.dart';
import 'package:latihan_soal/app/modules/dashboard/repo/repo_pelajaran.dart';
import 'package:latihan_soal/app/modules/dashboard/views/widget/paket_none.dart';
import 'package:latihan_soal/app/modules/dashboard/views/widget/paket_soal.dart';

import '../views/pelajaran_all.dart';

class DashboardController extends GetxController {
  String namaPelajaran = "";
  RxList<MataPelajaran?>? listPelajaran = <MataPelajaran>[].obs;
  final PelajaranRepository _pelajaranRepository = PelajaranRepository();
  final _isLoadingPage = true.obs;

  @override
  Future<void> onInit() async {
    listPelajaran?.value = (await _pelajaranRepository.pelajaran)!;
    _isLoadingPage.value = false;
    update(['listPelajaran']);
    super.onInit();
  }

  bool get isLoadingPage => _isLoadingPage.value;

  void pilihPelajaran(idPelajaran) {
    MataPelajaran? mtp =
        listPelajaran!.firstWhere((el) => el?.courseId == idPelajaran);
    if (mtp?.jumlahMateri == 0) {
      Get.to(() => PaketKosongPage(), arguments: mtp?.courseName);
    } else {
      Get.to(() => const PaketSoalPage(),
          arguments: mtp,
          binding: BindingsBuilder(
            () => Get.put<PaketSoalController>(PaketSoalController()),
          ));
    }
  }

  Future<void> lihatSemuaPelajaran() async {
    _isLoadingPage.value = true;
    Get.to(() => PelajaranAllPage());
    await Future.delayed(const Duration(seconds: 1));
    _isLoadingPage.value = false;
  }
}
