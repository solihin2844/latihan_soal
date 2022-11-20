// To parse this JSON data, do
//
//     final profilSiswa = profilSiswaFromJson(jsonString);

import 'dart:convert';

MataPelajaran mataPelajaranFromJson(String str) =>
    MataPelajaran.fromJson(json.decode(str));

String mataPelajaranToJson(MataPelajaran data) => json.encode(data.toJson());

class MataPelajaran {
  MataPelajaran({
    this.courseId,
    this.majorName,
    this.courseCategory,
    this.courseName,
    this.urlCover,
    this.jumlahMateri,
    this.jumlahDone,
    this.progress,
  });

  String? courseId;
  String? majorName;
  String? courseCategory;
  String? courseName;
  String? urlCover;
  int? jumlahMateri;
  int? jumlahDone;
  int? progress;

  factory MataPelajaran.fromJson(Map<String, dynamic> json) => MataPelajaran(
        courseId: json["course_id"],
        majorName: json["major_name"],
        courseCategory: json["course_category"],
        courseName: json["course_name"],
        urlCover: json["url_cover"],
        jumlahMateri: json["jumlah_materi"],
        jumlahDone: json["jumlah_done"],
        progress: json["progress"],
      );

  Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "major_name": majorName,
        "course_category": courseCategory,
        "course_name": courseName,
        "url_cover": urlCover,
        "jumlah_materi": jumlahMateri,
        "jumlah_done": jumlahDone,
        "progress": progress,
      };
}
