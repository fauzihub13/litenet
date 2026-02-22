import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/form_input.dart';
import 'package:litenet/core/widgets/row_title.dart';
import 'package:litenet/features/auth/presentation/controllers/login_provider.dart';
import 'package:litenet/gen/assets.gen.dart';
import 'package:litenet/routes/route_name.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isObscure = useState(true);

    final loginState = ref.watch(loginProvider);
    ref.listen(loginProvider, (previous, next) {
      if (next is AsyncError && next != previous) {
        final error = (next.error) as Failure;
        ScaffoldMessenger.of(context).clearSnackBars();
        print('GAGAL LOGINXXXX');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? 'Terjadi kesalahan'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (next.hasValue) {
        final data = next.value;
        if (data != null) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login berhasil!'),
              backgroundColor: Colors.green,
            ),
          );
          Future.delayed(const Duration(milliseconds: 500), () {
            if (Navigator.of(context).mounted)
              context.goNamed(RouteName.homePage);
          });
        }
      }
    });

    // Register listener once using useEffect
    // useEffect(() {

    //   return null; // no cleanup
    // }, const []);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Background Ungu
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 80),
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
                        "Masuk ke akun Anda untuk menggunakan aplikasi LiteNet",
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

            // Form Card
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
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Field Email
                        const RowTitle(title: "Email"),
                        const SizedBox(height: 8),
                        FormInput(
                          textController: emailController,
                          hintText: "user@example.com",
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email tidak boleh kosong';
                            }
                            final emailRegex = RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
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
                          textController: passwordController,
                          hintText: "*******",
                          obscureText: isObscure.value,
                          suffixIcon: Icon(
                            isObscure.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 22,
                          ),
                          onSuffixIconTap: () =>
                              isObscure.value = !isObscure.value,
                          validator: (value) => (value == null || value.isEmpty)
                              ? 'Sandi tidak boleh kosong'
                              : null,
                        ),
                        const SizedBox(height: 40),

                        // Tombol Masuk
                        Button(
                          text: "Masuk",
                          isLoading: loginState.isLoading,
                          isDisabled: loginState.isLoading,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print('presss');
                              ref
                                  .read(loginProvider.notifier)
                                  .login(
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                  );
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
