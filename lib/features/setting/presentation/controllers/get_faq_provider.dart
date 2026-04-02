import 'package:litenet/features/setting/data/di/usecase_provider.dart';
import 'package:litenet/features/setting/domain/entities/faq.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_faq_provider.g.dart';

@riverpod
class GetFAQ extends _$GetFAQ {
  @override
  FutureOr<FAQResponse?> build() async {
    return null;
  }

  Future<void> fetchFAQ() async {
    state = const AsyncValue.loading();

    final usecase = ref.read(getFAQUsecaseProvider);
    final result = await usecase.call();

    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) {
        state = AsyncValue.data(data);
      },
    );
  }
}

