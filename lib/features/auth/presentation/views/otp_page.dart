import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/provider/token_manager_provider.dart';
import 'package:litenet/core/provider/user_manager_provider.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_snackbar.dart';
import 'package:litenet/core/widgets/form_input.dart';
import 'package:litenet/core/widgets/row_title.dart';
import 'package:litenet/features/auth/presentation/controllers/otp_provider.dart';
import 'package:litenet/gen/assets.gen.dart';
import 'package:litenet/routes/route_name.dart';

class OTPPage extends HookConsumerWidget {
  final String email;
  const OTPPage({super.key, required this.email});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final otpController = useTextEditingController();
    emailController.text = email;

    final otpState = ref.watch(oTPProvider);
    ref.listen(oTPProvider, (previous, next) {
      next.when(
        data: (data) async {
          if (data != null) {
            if (data.data.isVerified) {
              // simpan token
              final tokenManager = await ref.read(tokenManagerProvider.future);
              await tokenManager.saveToken(data.data.token);

              // simpan user
              final userManager = await ref.read(userManagerProvider.future);
              await userManager.saveUser(data.data.user);
              if (!context.mounted) return;

              context.goNamed(RouteName.homePage);
            } else {
              context.showSuccess(data.message);
            }
          }
        },
        error: (err, _) {
          final error = err as Failure;
          context.showError(error.message ?? 'Terjadi kesalahan');
        },
        loading: () {},
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Background Ungu
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 10),
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
                      "Verifikasi OTP",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Silahkan masukan kode OTP yang telah dikirim ke email Anda",
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
            Stack(
              children: [
                Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    color: DefaultColors.purple500,
                  ),
                ),
                Padding(
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
                            readOnly: true,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 20),

                          // Field Kata Sandi
                          const RowTitle(title: "Kode OTP"),
                          const SizedBox(height: 8),
                          FormInput(
                            textController: otpController,
                            hintText: "000000",
                            validator: (value) =>
                                (value == null || value.isEmpty)
                                ? 'Kode OTP tidak boleh kosong'
                                : null,
                          ),
                          const SizedBox(height: 40),

                          // Tombol Masuk
                          Button(
                            text: "Verifikasi OTP",
                            isLoading: otpState.isLoading,
                            isDisabled: otpState.isLoading,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                ref
                                    .read(oTPProvider.notifier)
                                    .verifyOtp(
                                      email: emailController.text.trim(),
                                      otp: otpController.text.trim(),
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
                                  "Belum menerima OTP? ",
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(color: DefaultColors.black200),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(oTPProvider.notifier)
                                        .resendOtp(
                                          email: emailController.text.trim(),
                                        );
                                  },
                                  child: Text(
                                    "Kirim OTP",
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
