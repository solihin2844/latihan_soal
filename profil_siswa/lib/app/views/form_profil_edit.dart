import 'package:flutter/material.dart';

import '../../profil_siswa.dart';

class FormEditProfilePage extends StatefulWidget {
  final ProfilSiswa dataSiswa;
  final SaveCallback? onSaveChange;
  const FormEditProfilePage(
      {super.key, required this.dataSiswa, this.onSaveChange});

  @override
  State<FormEditProfilePage> createState() => _FormEditProfilePageState();
}

class _FormEditProfilePageState extends State<FormEditProfilePage> {
  final _etGender = TextEditingController();
  final _fullName = TextEditingController();
  final _userEmail = TextEditingController();
  final _userKelas = TextEditingController();
  final _userSekolah = TextEditingController();

  @override
  void initState() {
    super.initState();
    _etGender.text = widget.dataSiswa.userGender!;
    _fullName.text = widget.dataSiswa.fullName!;
    _userEmail.text = widget.dataSiswa.userEmail!;
    _userKelas.text = widget.dataSiswa.jenjang!;
    _userSekolah.text = widget.dataSiswa.userAsalSekolah!;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Data Diri',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: TextField(
            controller: _fullName,
            decoration: InputDecoration(
              labelText: 'Nama Lengkap',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onChanged: (value) => widget.dataSiswa.fullName = value,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: TextField(
            controller: _userEmail,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onChanged: (value) => widget.dataSiswa.userEmail = value,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: TextField(
            readOnly: true,
            controller: _etGender,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.arrow_drop_down),
              labelText: 'Jenis Kelamin',
              hintText: 'Pilih Jenis Kelamin',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onTap: () =>
                showModalBottomSheet(context: context, builder: chooseGender),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: TextField(
            controller: _userKelas,
            decoration: InputDecoration(
              labelText: 'Kelas',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onChanged: (value) => widget.dataSiswa.jenjang = value,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: TextField(
            controller: _userSekolah,
            decoration: InputDecoration(
              labelText: 'Sekolah',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onChanged: (value) => widget.dataSiswa.userAsalSekolah = value,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: ElevatedButton(
            onPressed: () => onUpdateData(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff3A7FD5),
            ),
            child: const Text('Perbarui Data'),
          ),
        ),
      ],
    );
  }

  void onUpdateData() {
    widget.onSaveChange?.call(widget.dataSiswa);
    debugPrint('onUpdateData');
    Navigator.pop(context, widget.dataSiswa);
  }

  Widget chooseGender(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
              title: const Text('Laki-laki'),
              onTap: () {
                setState(() {
                  _etGender.text = 'Laki-laki';
                });
                widget.dataSiswa.userGender = 'Laki-laki';
                Navigator.pop(context);
              }),
          const Divider(color: Colors.grey),
          ListTile(
              title: const Text('Perempuan'),
              onTap: () {
                setState(() {
                  _etGender.text = 'Perempuan';
                });
                widget.dataSiswa.userGender = 'Perempuan';
                Navigator.pop(context);
              }
              // controller.onSelectedGender(
              //   value: false,
              //   onSelected: () => Get.back(),
              // ),
              ),
        ],
      ),
    );
  }
}
