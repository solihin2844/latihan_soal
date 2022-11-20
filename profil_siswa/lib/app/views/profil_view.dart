import 'package:flutter/material.dart';

import 'package:konst_variabel/konst_variabel.dart';

import 'package:profil_siswa/app/views/profil_edit.dart';
import '../model/profil_model.dart';

typedef LogoutCallback = Future<String?>? Function();
typedef SaveCallback = Future<String?>? Function(ProfilSiswa);

class ProfilView extends StatefulWidget {
  ProfilView(
      {Key? key, this.onLogOutTap, required this.dataSiswa, this.onSaveChange})
      : super(key: key);

  final LogoutCallback? onLogOutTap;
  final SaveCallback? onSaveChange;
  ProfilSiswa dataSiswa;

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.all(0),
              color: warnaPutih,
              elevation: 10,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Identitas Diri',
                          style: heading5,
                        ),
                        OutlinedButton.icon(
                          onPressed: () async {
                            ProfilSiswa data = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfilPage(
                                  profilSiswa: widget.dataSiswa,
                                  onSaveChange: widget.onSaveChange,
                                ),
                              ),
                            );
                            setState(() {
                              widget.dataSiswa = data;
                            });
                          },
                          icon: const Icon(Icons.edit_note_sharp),
                          label: const Text('Edit'),
                        )
                      ],
                    ),
                    rowSpace(30),
                    Text(
                      'Nama Lengkap',
                      style: textGrey,
                    ),
                    Text(
                      widget.dataSiswa.fullName ?? '',
                      style: heading6,
                    ),
                    rowSpace(12),
                    Text(
                      'Email',
                      style: textGrey,
                    ),
                    Text(
                      '${widget.dataSiswa.userEmail}',
                      style: heading6,
                    ),
                    rowSpace(12),
                    Text(
                      'Jenis Kelamin',
                      style: textGrey,
                    ),
                    Text(
                      '${widget.dataSiswa.userGender}',
                      style: heading6,
                    ),
                    rowSpace(12),
                    Text(
                      'Kelas',
                      style: textGrey,
                    ),
                    Text(
                      '${widget.dataSiswa.jenjang}',
                      style: heading6,
                    ),
                    rowSpace(12),
                    Text(
                      'Sekolah',
                      style: textGrey,
                    ),
                    Text(
                      widget.dataSiswa.userAsalSekolah ?? '',
                      style: heading6,
                    ),
                  ],
                ),
              ),
            ),
            rowSpace(20),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: warnaPutih,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.0, 0.0), // shadow direction: bottom right
                  )
                ],
              ),
              child: InkWell(
                onTap: () => widget.onLogOutTap?.call(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      colSpace(6),
                      Text(
                        'Keluar',
                        style: heading6.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
