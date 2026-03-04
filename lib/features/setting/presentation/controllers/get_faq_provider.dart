import 'package:litenet/features/setting/data/di/usecase_provider.dart';
import 'package:litenet/features/setting/domain/entities/faq.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_faq_provider.g.dart';

@riverpod
class GetFAQ extends _$GetFAQ {
  @override
  FutureOr<FAQResponse> build() async {
    final usecase = ref.read(getFAQUsecaseProvider);
    final result = await usecase.call();

    return result.fold((failure) => throw failure, (data) => data);
  }
}
