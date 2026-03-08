// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_invoice_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DownloadInvoice)
const downloadInvoiceProvider = DownloadInvoiceProvider._();

final class DownloadInvoiceProvider
    extends $AsyncNotifierProvider<DownloadInvoice, String?> {
  const DownloadInvoiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadInvoiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadInvoiceHash();

  @$internal
  @override
  DownloadInvoice create() => DownloadInvoice();
}

String _$downloadInvoiceHash() => r'7ec28ebd5d08e3de7943236ea9d44ae7ebdc97dd';

abstract class _$DownloadInvoice extends $AsyncNotifier<String?> {
  FutureOr<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, String?>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
