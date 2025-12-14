import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/form_input.dart';
import 'package:litenet/core/widgets/row_title.dart';
import 'package:litenet/features/auth/presentation/views/login_page.dart';
import 'package:litenet/gen/assets.gen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool _isObscure = true;
  bool _isConfirmObscure = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(
        0xFFF8F9FD,
      ), // Background abu sangat muda di bagian bawah
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // 1. Background Ungu Atas
            Container(
              height: size.height * 0.35,
              width: double.infinity,
              decoration: const BoxDecoration(color: DefaultColors.purple500),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    SvgPicture.asset(
                      Assets.icons.iconLitenet,
                      width: 34,
                      height: 34,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Daftar",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Buat akun baru untuk menggunakan aplikasi",
                        textAlign: TextAlign.center,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 2. Form Card
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.25,
                left: PaddingSize.horizontal,
                right: PaddingSize.horizontal,
                bottom: 40,
              ),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Field Email
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

                      // Field Email
                      RowTitle(title: "Email"),
                      const SizedBox(height: 8),
                      FormInput(
                        textController: _emailController,
                        hintText: "sahroni@gmail.com",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Field No HP
                      RowTitle(title: "No HP"),
                      const SizedBox(height: 8),
                      FormInput(
                        textController: _phoneController,
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
                      const SizedBox(height: 20),

                      // Field Kata Sandi
                      RowTitle(title: "Kata Sandi"),
                      const SizedBox(height: 8),
                      FormInput(
                        textController: _passwordController,
                        hintText: "*******",
                        obscureText: _isObscure,
                        suffixIcon: Icon(
                          _isObscure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 22,
                        ),
                        onSuffixIconTap: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Kata Sandi tidak boleh kosong';
                          }
                          if (value.length < 6) {
                            return 'Kata Sandi minimal 6 karakter';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Field Kata Sandi
                      RowTitle(title: "Ulangi Kata Sandi"),
                      const SizedBox(height: 8),
                      FormInput(
                        textController: _confirmPasswordController,
                        hintText: "*******",
                        obscureText: _isConfirmObscure,
                        suffixIcon: Icon(
                          _isConfirmObscure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 22,
                        ),
                        onSuffixIconTap: () {
                          setState(() {
                            _isConfirmObscure = !_isConfirmObscure;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ulangi Kata Sandi tidak boleh kosong';
                          }
                          if (value != _passwordController.text) {
                            return 'Kata Sandi tidak cocok';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),

                      // Tombol Masuk Reusable
                      Button(
                        text: "Daftar",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Logika Register
                          }
                        },
                      ),
                      const SizedBox(height: 20),

                      // Link Daftar
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sudah punya akun? ",
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: DefaultColors.black200),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              },
                              child: Text(
                                "Masuk",
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: DefaultColors.purple500,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
