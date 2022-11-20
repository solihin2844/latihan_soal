import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:konst_variabel/konst_variabel.dart';
import 'package:latihan_soal/app/modules/home/views/util_widget/loading.dart';

import '../register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final _formSignup = GlobalKey<FormState>();
  RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrasi'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          height: MediaQuery.of(context).size.height - 86,
          decoration: BoxDecoration(
            color: warnaPutih,
          ),
          child: Form(
            key: _formSignup,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Email'),
                rowSpace(4),
                TextFormField(
                  controller: controller.txtEmail,
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {},
                  textInputAction: TextInputAction.next,
                  readOnly: true,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return ("Silakan masukkan email");
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Masukkan email yang valid");
                    }
                    return null;
                  }),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    prefixIcon: const Icon(Icons.email),
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                rowSpace(12),
                const Text('Nama Lengkap'),
                rowSpace(4),
                TextFormField(
                  controller: controller.txtNama,
                  autofocus: false,
                  onSaved: (value) {},
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{3,}$');
                    if (value!.isEmpty) {
                      return ("Nama tidak boleh kosong");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Nama minimal 3 karakter");
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    prefixIcon: const Icon(Icons.person),
                    hintText: 'Nama',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                rowSpace(12),
                const Text('Jenis Kelamin'),
                rowSpace(4),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Obx(() => Radio(
                                value: 'Laki-laki',
                                groupValue: controller.gender.value,
                                onChanged: ((value) =>
                                    controller.handleGender(value)),
                              )),
                          const Text(
                            'Laki-laki',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Obx(
                            () => Radio(
                              value: 'Perempuan',
                              groupValue: controller.gender.value,
                              onChanged: ((value) =>
                                  controller.handleGender(value)),
                            ),
                          ),
                          const Text(
                            'Perempuan',
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                rowSpace(12),
                Obx(
                  () => DropdownSearch<String>(
                    items: const ['X-IPA', 'XI-IPA', 'XII-IPA'],
                    popupProps: const PopupProps.menu(
                      isFilterOnline: true,
                      showSelectedItems: true,
                    ),
                    itemAsString: (item) => item,
                    selectedItem: controller.kelas.value,
                    onChanged: (value) => controller.setKelas(value),
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: 'Pilih Kelas',
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      ),
                    ),
                  ),
                ),
                rowSpace(20),
                const Text('Nama Sekolah'),
                rowSpace(4),
                TextFormField(
                  controller: controller.txtNamaSekolah,
                  autofocus: false,
                  textCapitalization: TextCapitalization.words,
                  onSaved: (value) {},
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                      return ("Nama Sekola tidak boleh kosong");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Nama Sekolah minimal 6 karakter");
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    prefixIcon: const Icon(Icons.business),
                    hintText: 'Nama Sekolah',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                rowSpace(20),
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.teal[700],
                  child: SizedBox(
                    height: 60,
                    child: GetX<RegisterController>(
                        builder: (_) => controller.isLoadingRegister
                            ? buildLoading(context)
                            : MaterialButton(
                                onPressed: () {
                                  if (_formSignup.currentState!.validate()) {
                                    controller.handleRegister();
                                  }
                                },
                                padding: const EdgeInsets.all(12),
                                minWidth: Get.width,
                                child: Text(
                                  'Daftar',
                                  textAlign: TextAlign.center,
                                  style: text22Putih,
                                ),
                              )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
