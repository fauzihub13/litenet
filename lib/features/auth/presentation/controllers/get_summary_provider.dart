import 'package:litenet/features/auth/data/di/usecase_provider.dart';
import 'package:litenet/features/auth/domain/entities/summary.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_summary_provider.g.dart';

@riverpod
class GetSummary extends _$GetSummary {
  @override
  FutureOr<SummaryResponse?> build() async {
    return null;
  }

  Future<void> fetchSummary() async {
    state = const AsyncValue.loading();

    final usecase = ref.read(getSummaryUsecaseProvider);
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
