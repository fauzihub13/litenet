import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/presentation/controllers/user_manager_provider.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_snackbar.dart';
import 'package:litenet/core/widgets/empty_state.dart';
import 'package:litenet/core/widgets/form_input.dart';
import 'package:litenet/core/widgets/row_title.dart';
import 'package:litenet/features/setting/presentation/controllers/change_profile_provider.dart';
import 'package:litenet/features/setting/presentation/controllers/get_profile_provider.dart';

class ChangeProfilePage extends HookConsumerWidget {
  const ChangeProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final phoneNumberController = useTextEditingController();

    final asyncGetProfile = ref.watch(getProfileProvider);
    final asyncChangeProfile = ref.watch(changeProfileProvider);

    ref.listen(changeProfileProvider, (previous, next) {
      next.when(
        data: (data) async {
          if (data != null) {
            ref.invalidate(getCurrentUserProvider);
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

    useEffect(() {
      asyncGetProfile.whenData((data) {
        nameController.text = data.data.name;
        emailController.text = data.data.email;
        phoneNumberController.text = data.data.phoneNumber;
      });
      return null; // dispose
    }, [asyncGetProfile.hasValue]);

    return Scaffold(
      appBar: CustomAppbar(title: 'Ubah Profil'),
      body: asyncGetProfile.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PaddingSize.horizontal,
            ),
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(getProfileProvider);
              },
              child: Form(
                key: formKey,
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    const SizedBox(height: 40),

                    // Name
                    RowTitle(title: "Nama Lengkap"),
                    const SizedBox(height: 8),
                    FormInput(
                      textController: nameController,
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
                      textController: emailController,
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
                      textController: phoneNumberController,
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
                      isDisabled: asyncChangeProfile.isLoading,
                      isLoading: asyncChangeProfile.isLoading,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ref
                              .read(changeProfileProvider.notifier)
                              .changeProfile(
                                name: nameController.text,
                                email: emailController.text.trim(),
                                phoneNumber: phoneNumberController.text,
                              );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        error: (error, _) {
          String errorMessage =
              (error as Failure).message ?? 'Terjadi kesalahan';
          return EmptyState(message: errorMessage);
        },
        loading: () {
          return Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }
}
