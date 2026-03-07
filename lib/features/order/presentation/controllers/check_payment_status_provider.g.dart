// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_payment_status_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CheckPaymentStatus)
const checkPaymentStatusProvider = CheckPaymentStatusProvider._();

final class CheckPaymentStatusProvider
    extends
        $AsyncNotifierProvider<
          CheckPaymentStatus,
          CheckPaymentStatusResponse?
        > {
  const CheckPaymentStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkPaymentStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkPaymentStatusHash();

  @$internal
  @override
  CheckPaymentStatus create() => CheckPaymentStatus();
}

String _$checkPaymentStatusHash() =>
    r'280f56314572f51c50b10de8a1fee36f3989652b';

abstract class _$CheckPaymentStatus
    extends $AsyncNotifier<CheckPaymentStatusResponse?> {
  FutureOr<CheckPaymentStatusResponse?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<CheckPaymentStatusResponse?>,
              CheckPaymentStatusResponse?
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<CheckPaymentStatusResponse?>,
                CheckPaymentStatusResponse?
              >,
              AsyncValue<CheckPaymentStatusResponse?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
