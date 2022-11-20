import 'package:flutter/material.dart';
import 'package:profil_siswa/profil_siswa.dart';
import 'form_profil_edit.dart';

class EditProfilPage extends StatelessWidget {
  final ProfilSiswa profilSiswa;
  final SaveCallback? onSaveChange;
  const EditProfilPage(
      {super.key, required this.profilSiswa, this.onSaveChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Edit Akun'),
      centerTitle: true,
      backgroundColor: const Color(0xff3A7FD5),
    );
  }

  Widget buildBody(BuildContext context) {
    return FormEditProfilePage(
        dataSiswa: profilSiswa, onSaveChange: onSaveChange);
  }
}
