import 'package:flutter/material.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/form_input.dart';
import 'package:litenet/core/widgets/row_title.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPassswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirNewPasswordController =
      TextEditingController();

  bool _isObscureOldPassword = true;
  bool _isObscureNewpassword = true;
  bool _isObscureConfirmNewpassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Ubah Kata Sandi'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PaddingSize.horizontal),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Name
              RowTitle(title: "Kata Sandi Lama"),
              const SizedBox(height: 8),
              FormInput(
                textController: _oldPassswordController,
                hintText: "********",
                obscureText: _isObscureOldPassword,
                suffixIcon: Icon(
                  _isObscureOldPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 22,
                ),
                onSuffixIconTap: () {
                  setState(() {
                    _isObscureOldPassword = !_isObscureOldPassword;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kata sandi lama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Kata Sandi Baru
              RowTitle(title: "Kata Sandi Baru"),
              const SizedBox(height: 8),
              FormInput(
                textController: _newPasswordController,
                keyboardType: TextInputType.number,
                hintText: "*******",
                obscureText: _isObscureNewpassword,
                suffixIcon: Icon(
                  _isObscureNewpassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 22,
                ),
                onSuffixIconTap: () {
                  setState(() {
                    _isObscureNewpassword = !_isObscureNewpassword;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kata sandi tidak boleh kosong';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Ulangi Kata Sandi Baru
              RowTitle(title: "Ulangi Kata Sandi Baru"),
              const SizedBox(height: 8),
              FormInput(
                textController: _confirNewPasswordController,
                keyboardType: TextInputType.number,
                hintText: "*******",
                obscureText: _isObscureConfirmNewpassword,
                suffixIcon: Icon(
                  _isObscureConfirmNewpassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 22,
                ),
                onSuffixIconTap: () {
                  setState(() {
                    _isObscureConfirmNewpassword =
                        !_isObscureConfirmNewpassword;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kata sandi tidak boleh kosong';
                  }
                  if (value != _newPasswordController.text) {
                    return 'Kata Sandi tidak cocok';
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
