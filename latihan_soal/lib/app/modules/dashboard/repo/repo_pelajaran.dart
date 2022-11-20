import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:latihan_soal/app/data/models/mata_pelajaran.dart';

import '../../../data/konstanta.dart';
import '../../../data/models/paket_soal.dart';

abstract class PelajaranRepositoryA {
  Future<List<MataPelajaran?>?> get pelajaran;
  Future<List<PaketSoal?>?> paketsoal(String id);
}

class PelajaranRepository implements PelajaranRepositoryA {
  Dio _dio() {
    BaseOptions options =
        BaseOptions(baseUrl: Urls.baseUrl, responseType: ResponseType.json);
    final dio = Dio(options);
    return dio;
  }

  @override
  Future<List<MataPelajaran?>?> get pelajaran async {
    try {
      final result =
          await _dio().get('', queryParameters: {"minta": "pelajaran"});
      //List<MataPelajaran> res = .fromJson(result.data);
      //return res;
      final pelajaranJSON = result.data["data"];
      List<MataPelajaran> list = [];
      for (var pel in pelajaranJSON) {
        list.add(MataPelajaran.fromJson(pel));
      }
      //pelajaranJSON.map((e) => MataPelajaran.fromJson(e));
      return list;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getPelajaran: $e, $stackTrace');
      }
      return null;
    }

    // final pelajaran = [
    //   MataPelajaran(
    //       courseId: "mtk1",
    //       majorName: "IPA",
    //       courseName: "Matematika",
    //       urlCover: "assets/pelajaran/matematika.png",
    //       jumlahMateri: 4,
    //       jumlahDone: 0),
    //   MataPelajaran(
    //       courseId: "fisika",
    //       majorName: "IPA",
    //       courseName: "Fisika",
    //       urlCover: "assets/pelajaran/fisika.png",
    //       jumlahMateri: 0,
    //       jumlahDone: 0),
    //   MataPelajaran(
    //       courseId: "kimia",
    //       majorName: "IPA",
    //       courseName: "Kimia",
    //       urlCover: "assets/pelajaran/kimia.png",
    //       jumlahMateri: 2,
    //       jumlahDone: 0),
    //   MataPelajaran(
    //       courseId: "biologi",
    //       majorName: "IPA",
    //       courseName: "Biologi",
    //       urlCover: "assets/pelajaran/biologi.png",
    //       jumlahMateri: 0,
    //       jumlahDone: 0),
    //   MataPelajaran(
    //       courseId: "bahasa_01",
    //       majorName: "BAHASA",
    //       courseName: "Bahasa Indonesia",
    //       urlCover: "assets/pelajaran/indonesia.png",
    //       jumlahMateri: 4,
    //       jumlahDone: 0),
    //   MataPelajaran(
    //       courseId: "bahasa_02",
    //       majorName: "BAHASA",
    //       courseName: "Bahasa Inggris",
    //       urlCover: "assets/pelajaran/inggris.png",
    //       jumlahMateri: 4,
    //       jumlahDone: 0),
    //   MataPelajaran(
    //       courseId: "program",
    //       majorName: "IPA",
    //       courseName: "Dasar Pemrograman",
    //       urlCover: "assets/pelajaran/matematika.png",
    //       jumlahMateri: 4,
    //       jumlahDone: 0),
    // ];

    // return pelajaran;
  }

  @override
  Future<List<PaketSoal?>?> paketsoal(String id) async {
    try {
      final result = await _dio()
          .get('', queryParameters: {"minta": "paket_soal", "courseId": id});
      //List<MataPelajaran> res = .fromJson(result.data);
      //return res;
      final pelajaranJSON = result.data["data"];
      List<PaketSoal> list = [];
      for (var pel in pelajaranJSON) {
        list.add(PaketSoal.fromJson(pel));
      }
      //pelajaranJSON.map((e) => MataPelajaran.fromJson(e));
      return list;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getPelajaran: $e, $stackTrace');
      }
      return null;
    }
  }
}
