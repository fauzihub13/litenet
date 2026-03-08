import 'package:litenet/features/order/data/di/usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'download_invoice_provider.g.dart';

@riverpod
class DownloadInvoice extends _$DownloadInvoice {
  @override
  FutureOr<String?> build() => null;

  Future<void> executeDownload(String orderId) async {
    state = const AsyncLoading();

    final usecase = ref.read(downloadInvoiceUsecaseProvider);
    final result = await usecase.call(orderId: orderId);

    state = await result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (savePath) async {
        try {
          return AsyncData(savePath);
        } catch (e, stack) {
          return AsyncError(e, stack);
        }
      },
    );
  }
}
