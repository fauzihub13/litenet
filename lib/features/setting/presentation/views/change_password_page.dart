import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_snackbar.dart';
import 'package:litenet/core/widgets/form_input.dart';
import 'package:litenet/core/widgets/row_title.dart';
import 'package:litenet/features/setting/presentation/controllers/change_password_provider.dart';

class ChangePasswordPage extends HookConsumerWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final oldPassswordController = useTextEditingController();
    final newPasswordController = useTextEditingController();
    final confirmationNewController = useTextEditingController();

    final isObscureOldPassword = useState(true);
    final isObscureNewpassword = useState(true);
    final isObscureConfirmNewpassword = useState(true);
    final asyncChangePassword = ref.watch(changePasswordProvider);

    ref.listen(changePasswordProvider, (previous, next) {
      next.when(
        data: (data) async {
          if (data != null) {
            oldPassswordController.clear();
            newPasswordController.clear();
            confirmationNewController.clear();
            context.showSuccess(data.message);
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
      appBar: CustomAppbar(title: 'Ubah Kata Sandi'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PaddingSize.horizontal),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Name
              RowTitle(title: "Kata Sandi Lama"),
              const SizedBox(height: 8),
              FormInput(
                textController: oldPassswordController,
                hintText: "********",
                obscureText: isObscureOldPassword.value,
                suffixIcon: Icon(
                  isObscureOldPassword.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 22,
                ),
                onSuffixIconTap: () {
                  isObscureOldPassword.value = !isObscureOldPassword.value;
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
                textController: newPasswordController,
                keyboardType: TextInputType.number,
                hintText: "*******",
                obscureText: isObscureNewpassword.value,
                suffixIcon: Icon(
                  isObscureNewpassword.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 22,
                ),
                onSuffixIconTap: () {
                  isObscureNewpassword.value = !isObscureNewpassword.value;
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
                textController: confirmationNewController,
                keyboardType: TextInputType.number,
                hintText: "*******",
                obscureText: isObscureConfirmNewpassword.value,
                suffixIcon: Icon(
                  isObscureConfirmNewpassword.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 22,
                ),
                onSuffixIconTap: () {
                  isObscureConfirmNewpassword.value =
                      !isObscureConfirmNewpassword.value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kata sandi tidak boleh kosong';
                  }
                  if (value != newPasswordController.text) {
                    return 'Kata Sandi tidak cocok';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 60),

              // Tombol Masuk Reusable
              Button(
                text: "Simpan",
                isDisabled: asyncChangePassword.isLoading,
                isLoading: asyncChangePassword.isLoading,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ref
                        .read(changePasswordProvider.notifier)
                        .changePassword(
                          oldPassword: oldPassswordController.text,
                          newPassword: newPasswordController.text,
                          confirmNewPassword: confirmationNewController.text,
                        );
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

// class _ChangePasswordPageState extends State<ChangePasswordPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _oldPassswordController = TextEditingController();
//   final TextEditingController _newPasswordController = TextEditingController();
//   final TextEditingController _confirNewPasswordController =
//       TextEditingController();

//   bool _isObscureOldPassword = true;
//   bool _isObscureNewpassword = true;
//   bool _isObscureConfirmNewpassword = true;

// }
