import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/form_input.dart';
import 'package:litenet/core/widgets/row_title.dart';
import 'package:litenet/gen/assets.gen.dart';
import 'package:litenet/routes/route_name.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isObscure = true;
  bool _isConfirmObscure = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Header Background Ungu (Dinamis mengikuti panjang teks)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                bottom: 60,
              ), // Ruang ekstra untuk overlap card
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
                        "Buat akun baru untuk menggunakan aplikasi LiteNet",
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

            // 2. Form Card (Menggunakan Transform.translate agar overlap tanpa menindih teks)
            Transform.translate(
              offset: const Offset(0, -70),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: PaddingSize.horizontal,
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
                        // Nama Lengkap
                        const RowTitle(title: "Nama Lengkap"),
                        const SizedBox(height: 8),
                        FormInput(
                          textController: _nameController,
                          hintText: "Sahroni Ahmad",
                          validator: (value) => (value == null || value.isEmpty)
                              ? 'Nama tidak boleh kosong'
                              : null,
                        ),
                        const SizedBox(height: 20),

                        // Email
                        const RowTitle(title: "Email"),
                        const SizedBox(height: 8),
                        FormInput(
                          textController: _emailController,
                          hintText: "sahroni@gmail.com",
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email tidak boleh kosong';
                            }

                            final emailRegex = RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            );
                            if (!emailRegex.hasMatch(value)) {
                              return 'Format email salah';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        // No HP
                        const RowTitle(title: "No HP"),
                        const SizedBox(height: 8),
                        FormInput(
                          textController: _phoneController,
                          keyboardType: TextInputType.phone,
                          hintText: "08123456789",
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(13),
                          ],
                          validator: (value) =>
                              (value == null || value.length < 10)
                              ? 'No HP minimal 10 digit'
                              : null,
                        ),
                        const SizedBox(height: 20),

                        // Kata Sandi
                        const RowTitle(title: "Kata Sandi"),
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
                          onSuffixIconTap: () =>
                              setState(() => _isObscure = !_isObscure),
                          validator: (value) =>
                              (value == null || value.length < 6)
                              ? 'Sandi minimal 6 karakter'
                              : null,
                        ),
                        const SizedBox(height: 20),

                        // Ulangi Kata Sandi
                        const RowTitle(title: "Ulangi Kata Sandi"),
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
                          onSuffixIconTap: () => setState(
                            () => _isConfirmObscure = !_isConfirmObscure,
                          ),
                          validator: (value) =>
                              (value != _passwordController.text)
                              ? 'Kata sandi tidak cocok'
                              : null,
                        ),
                        const SizedBox(height: 40),

                        // Tombol Daftar
                        Button(
                          text: "Daftar",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Jalankan logic register Anda di sini
                            }
                          },
                        ),
                        const SizedBox(height: 20),

                        // Link ke Login
                        Center(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                "Sudah punya akun? ",
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(color: DefaultColors.black200),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    context.goNamed(RouteName.loginPage),
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
            ),
            const SizedBox(height: 20), // Padding bawah agar scroll tidak mepet
          ],
        ),
      ),
    );
  }
}
