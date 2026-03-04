import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/empty_state.dart';
import 'package:litenet/features/setting/domain/entities/faq.dart';
import 'package:litenet/features/setting/presentation/controllers/get_faq_provider.dart';

class FAQPage extends ConsumerWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFAQ = ref.watch(getFAQProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbar(title: 'FAQ'),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(getFAQProvider);
        },
        child: asyncFAQ.when(
          data: (data) {
            List<FAQDataEntity> faqData = data.data;
            return ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              itemCount: faqData.length,
              separatorBuilder: (context, index) => Divider(
                color: DefaultColors.purple50.withValues(alpha: 0.5),
                thickness: 1,
              ),
              itemBuilder: (context, index) {
                FAQDataEntity faq = faqData[index];
                return Theme(
                  // Menghilangkan garis divider bawaan ExpansionTile
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    iconColor: DefaultColors.purple500,
                    collapsedIconColor: DefaultColors.purple500,
                    title: Text(
                      faq.title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: DefaultColors.purple500,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          faq.description,
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: DefaultColors.black200,
                                height: 1.5,
                              ),
                        ),
                      ),
                    ],
                  ),
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
}

class FAQModel {
  final String question;
  final String answer;

  FAQModel({required this.question, required this.answer});
}
