// To parse this JSON data, do
//
//     final paketSoal = paketSoalFromJson(jsonString);

import 'dart:convert';

PaketSoal paketSoalFromJson(String str) => PaketSoal.fromJson(json.decode(str));

String paketSoalToJson(PaketSoal data) => json.encode(data.toJson());

class PaketSoal {
  PaketSoal({
    this.exerciseId,
    this.exerciseTitle,
    this.accessType,
    this.icon,
    this.exerciseUserStatus,
    this.jumlahSoal,
    this.jumlahDone,
  });

  String? exerciseId;
  String? exerciseTitle;
  String? accessType;
  String? icon;
  String? exerciseUserStatus;
  int? jumlahSoal;
  int? jumlahDone;

  factory PaketSoal.fromJson(Map<String, dynamic> json) => PaketSoal(
        exerciseId: json["exercise_id"],
        exerciseTitle: json["exercise_title"],
        accessType: json["access_type"],
        icon: json["icon"],
        exerciseUserStatus: json["exercise_user_status"],
        jumlahSoal: json["jumlah_soal"],
        jumlahDone: json["jumlah_done"],
      );

  Map<String, dynamic> toJson() => {
        "exercise_id": exerciseId,
        "exercise_title": exerciseTitle,
        "access_type": accessType,
        "icon": icon,
        "exercise_user_status": exerciseUserStatus,
        "jumlah_soal": jumlahSoal,
        "jumlah_done": jumlahDone,
      };
}
