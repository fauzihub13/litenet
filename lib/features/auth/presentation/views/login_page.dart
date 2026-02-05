import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/form_input.dart';
import 'package:litenet/core/widgets/row_title.dart';
import 'package:litenet/gen/assets.gen.dart';
import 'package:litenet/routes/route_name.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Header Background Ungu (Dinamis tanpa Stack)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                bottom: 80,
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

            // 2. Form Card (Menggunakan Transform agar tetap overlap secara aman)
            Transform.translate(
              offset: const Offset(0, -90),
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
                        color: Colors.black.withValues(alpha: 0.08),
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
                        const RowTitle(title: "Email"),
                        const SizedBox(height: 8),
                        FormInput(
                          textController: _emailController,
                          hintText: "sahroni@gmail.com",
                          keyboardType: TextInputType.text,
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

                        // Field Kata Sandi
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
                          validator: (value) => (value == null || value.isEmpty)
                              ? 'Sandi tidak boleh kosong'
                              : null,
                        ),
                        const SizedBox(height: 40),

                        // Tombol Masuk
                        Button(
                          text: "Masuk",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.goNamed(RouteName.homePage);
                            }
                          },
                        ),
                        const SizedBox(height: 20),

                        // Link Daftar
                        Center(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                "Belum punya akun? ",
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(color: DefaultColors.black200),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    context.goNamed(RouteName.registerPage),
                                child: Text(
                                  "Daftar",
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
