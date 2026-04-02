import 'package:litenet/features/quota/data/di/usecase_provider.dart';
import 'package:litenet/features/quota/domain/entities/detail_quota.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_detail_quota_provider.g.dart';

@riverpod
class GetDetailQuota extends _$GetDetailQuota {
  @override
  FutureOr<DetailQuotaResponse?> build({required String id}) async {
    return null;
  }

  Future<void> fetchDetailQuota(String id) async {
    state = const AsyncValue.loading();

    final usecase = ref.read(getDetailQuotaUsecaseProvider);
    final result = await usecase.call(id: id);

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
