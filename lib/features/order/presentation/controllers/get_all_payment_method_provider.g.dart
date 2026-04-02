// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_payment_method_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetAllPaymentMethod)
const getAllPaymentMethodProvider = GetAllPaymentMethodProvider._();

final class GetAllPaymentMethodProvider
    extends
        $AsyncNotifierProvider<GetAllPaymentMethod, PaymentMethodResponse?> {
  const GetAllPaymentMethodProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAllPaymentMethodProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAllPaymentMethodHash();

  @$internal
  @override
  GetAllPaymentMethod create() => GetAllPaymentMethod();
}

String _$getAllPaymentMethodHash() =>
    r'c01b7256b0e05fe2fea9b901402acd90d97f0e4b';

abstract class _$GetAllPaymentMethod
    extends $AsyncNotifier<PaymentMethodResponse?> {
  FutureOr<PaymentMethodResponse?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<PaymentMethodResponse?>, PaymentMethodResponse?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PaymentMethodResponse?>,
                PaymentMethodResponse?
              >,
              AsyncValue<PaymentMethodResponse?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
