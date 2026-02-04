import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/form_input.dart';
import 'package:litenet/core/widgets/row_title.dart';

class ChangeProfilePage extends StatefulWidget {
  const ChangeProfilePage({super.key});

  @override
  State<ChangeProfilePage> createState() => _ChangeProfilePageState();
}

class _ChangeProfilePageState extends State<ChangeProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Ubah Profil'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PaddingSize.horizontal),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Name
              RowTitle(title: "Nama Lengkap"),
              const SizedBox(height: 8),
              FormInput(
                textController: _nameController,
                hintText: "Sahroni Ahmad",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Email
              RowTitle(title: "Email"),
              const SizedBox(height: 8),
              FormInput(
                textController: _emailController,
                hintText: "sahroni@gmail.com",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  final emailRegex = RegExp(
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
                  );
                  if (!emailRegex.hasMatch(value)) {
                    return 'Masukkan format email yang valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Phone Number
              RowTitle(title: "No HP"),
              const SizedBox(height: 8),
              FormInput(
                textController: _phoneNumberController,
                keyboardType: TextInputType.number,
                hintText: "08123456789",
                // Menambahkan formatter agar hanya angka yang bisa masuk
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(
                    13,
                  ), // Batas maksimal digit No HP
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'No HP tidak boleh kosong';
                  }
                  if (value.length < 10) {
                    return 'Nomor HP minimal 10 digit';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 60),

              // Tombol Masuk Reusable
              Button(
                text: "Simpan",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Logika Register
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
