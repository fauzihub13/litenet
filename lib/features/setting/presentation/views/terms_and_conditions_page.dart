import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/empty_state.dart';
import 'package:litenet/features/setting/domain/entities/privacy_and_policy.dart';
import 'package:litenet/features/setting/presentation/controllers/get_privacy_and_policy_provider.dart';

class TermsAndConditionsPage extends ConsumerWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPrivacyAndPolicy = ref.watch(getPrivacyAndPolicyProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbar(title: 'Syarat dan Ketentuan'),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(getPrivacyAndPolicyProvider);
        },
        child: asyncPrivacyAndPolicy.when(
          data: (data) {
            List<PrivacyAndPolicyDataEntity> privacyAndPolicyData = data.data;
            if (privacyAndPolicyData.isEmpty) {
              return EmptyState(
                message: 'Tidak ditemukan data',
                isRefreshable: true,
              );
            }
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              itemCount: privacyAndPolicyData.length,
              itemBuilder: (context, index) {
                PrivacyAndPolicyDataEntity privacyAndPolicy =
                    privacyAndPolicyData[index];
                return _buildSection(
                  context,
                  title: "${index + 1}. ${privacyAndPolicy.title}",
                  content: privacyAndPolicy.description,
                );
              },
            );
          },
          error: (error, _) {
            String errorMessage =
                (error as Failure).message ?? 'Terjadi kesalahan';
            return EmptyState(message: errorMessage, isRefreshable: true);
          },
          loading: () {
            return Center(child: const CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: DefaultColors.purple600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: DefaultColors.black200),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
