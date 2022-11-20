// To parse this JSON data, do
//
//     final profilSiswa = profilSiswaFromJson(jsonString);

import 'dart:convert';

ProfilSiswa profilSiswaFromJson(String str) =>
    ProfilSiswa.fromJson(json.decode(str));

String profilSiswaToJson(ProfilSiswa data) => json.encode(data.toJson());

class ProfilSiswa {
  ProfilSiswa({
    this.iduser,
    this.userName,
    this.userEmail,
    this.fullName,
    this.userFoto,
    this.userAsalSekolah,
    this.dateCreate,
    this.jenjang,
    this.userGender,
    this.userStatus,
    this.kelas,
  });

  String? iduser;
  String? userName;
  String? userEmail;
  String? fullName;
  String? userFoto;
  String? userAsalSekolah;
  DateTime? dateCreate;
  String? jenjang;
  String? userGender;
  String? userStatus;
  String? kelas;

  factory ProfilSiswa.fromJson(Map<String, dynamic> json) => ProfilSiswa(
        iduser: json["iduser"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        fullName: json["nama_lengkap"],
        userFoto: json["user_foto"],
        userAsalSekolah: json["user_asal_sekolah"],
        dateCreate: DateTime.parse(json["date_create"]),
        jenjang: json["jenjang"],
        userGender: json["user_gender"],
        userStatus: json["user_status"],
        kelas: json["kelas"],
      );

  Map<String, dynamic> toJson() => {
        "iduser": iduser,
        "user_name": userName,
        "user_email": userEmail,
        "nama_lengkap": fullName,
        "user_foto": userFoto,
        "user_asal_sekolah": userAsalSekolah,
        "date_create": dateCreate?.toIso8601String(),
        "jenjang": jenjang,
        "user_gender": userGender,
        "user_status": userStatus,
        "kelas": kelas,
      };
}
