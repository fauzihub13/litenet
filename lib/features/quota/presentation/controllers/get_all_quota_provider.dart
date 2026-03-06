import 'package:litenet/features/quota/data/di/usecase_provider.dart';
import 'package:litenet/features/quota/domain/entities/quota.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_quota_provider.g.dart';

@riverpod
class GetAllQuota extends _$GetAllQuota {
  @override
  FutureOr<QuotaResponse> build() async {
    final usecase = ref.read(getAllQuotasUsecaseProvider);
    final result = await usecase.call();

    return result.fold((failure) => throw failure, (data) => data);
  }
}
