import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/form_input.dart';
import 'package:litenet/core/widgets/row_title.dart';
import 'package:litenet/gen/assets.gen.dart';
import 'package:litenet/routes/route_name.dart';
// Import file assets gen dan theme Anda di sini
// import 'gen/assets.gen.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isObscure = true;

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
              height: size.height * 0.45,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: DefaultColors.purple500,
                // Jika ingin menambahkan bintik-bintik bisa menggunakan image pattern
                // image: DecorationImage(image: AssetImage(Assets.images.bgStars.path), fit: BoxFit.cover)
              ),
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
                      "Masuk",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Gunakan email dan password anda untuk masuk",
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
                top: size.height * 0.3,
                left: PaddingSize.horizontal,
                right: PaddingSize.horizontal,
              ),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
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
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),

                      // Tombol Masuk Reusable
                      Button(
                        text: "Masuk",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.pushNamed(RouteName.homePage);
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
                              "Belum punya akun? ",
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: DefaultColors.black200),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.pushNamed(RouteName.registerPage);
                              },
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
          ],
        ),
      ),
    );
  }
}
