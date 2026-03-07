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
    extends $AsyncNotifierProvider<GetAllPaymentMethod, PaymentMethodResponse> {
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
    r'ed7ead4261b49a7737a6cf7efeb524a13b52a140';

abstract class _$GetAllPaymentMethod
    extends $AsyncNotifier<PaymentMethodResponse> {
  FutureOr<PaymentMethodResponse> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<PaymentMethodResponse>, PaymentMethodResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PaymentMethodResponse>,
                PaymentMethodResponse
              >,
              AsyncValue<PaymentMethodResponse>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
