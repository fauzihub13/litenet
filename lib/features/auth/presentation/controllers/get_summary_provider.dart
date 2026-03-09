import 'package:litenet/features/auth/data/di/usecase_provider.dart';
import 'package:litenet/features/auth/domain/entities/summary.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_summary_provider.g.dart';

@riverpod
class GetSummary extends _$GetSummary {
  @override
  FutureOr<SummaryResponse> build() async {
    final usecase = ref.read(getSummaryUsecaseProvider);
    final result = await usecase.call();

    return result.fold((failure) => throw failure, (data) => data);
  }
}
