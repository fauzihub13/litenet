// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usecase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getAllPaymentMethodUsecase)
const getAllPaymentMethodUsecaseProvider =
    GetAllPaymentMethodUsecaseProvider._();

final class GetAllPaymentMethodUsecaseProvider
    extends
        $FunctionalProvider<
          GetAllPaymentMethodUsecase,
          GetAllPaymentMethodUsecase,
          GetAllPaymentMethodUsecase
        >
    with $Provider<GetAllPaymentMethodUsecase> {
  const GetAllPaymentMethodUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAllPaymentMethodUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAllPaymentMethodUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetAllPaymentMethodUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetAllPaymentMethodUsecase create(Ref ref) {
    return getAllPaymentMethodUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetAllPaymentMethodUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetAllPaymentMethodUsecase>(value),
    );
  }
}

String _$getAllPaymentMethodUsecaseHash() =>
    r'155877eddac7de4517acda6af59b02c28d5905bd';

@ProviderFor(createTransactionUsecase)
const createTransactionUsecaseProvider = CreateTransactionUsecaseProvider._();

final class CreateTransactionUsecaseProvider
    extends
        $FunctionalProvider<
          CreateTransactionUsecase,
          CreateTransactionUsecase,
          CreateTransactionUsecase
        >
    with $Provider<CreateTransactionUsecase> {
  const CreateTransactionUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createTransactionUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createTransactionUsecaseHash();

  @$internal
  @override
  $ProviderElement<CreateTransactionUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateTransactionUsecase create(Ref ref) {
    return createTransactionUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateTransactionUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateTransactionUsecase>(value),
    );
  }
}

String _$createTransactionUsecaseHash() =>
    r'7e88c8c8c618e12d1ea0f1abe8d2232fe5eba3a1';

@ProviderFor(checkPaymentStatusUsecase)
const checkPaymentStatusUsecaseProvider = CheckPaymentStatusUsecaseProvider._();

final class CheckPaymentStatusUsecaseProvider
    extends
        $FunctionalProvider<
          CheckPaymentStatusUsecase,
          CheckPaymentStatusUsecase,
          CheckPaymentStatusUsecase
        >
    with $Provider<CheckPaymentStatusUsecase> {
  const CheckPaymentStatusUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkPaymentStatusUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkPaymentStatusUsecaseHash();

  @$internal
  @override
  $ProviderElement<CheckPaymentStatusUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CheckPaymentStatusUsecase create(Ref ref) {
    return checkPaymentStatusUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheckPaymentStatusUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheckPaymentStatusUsecase>(value),
    );
  }
}

String _$checkPaymentStatusUsecaseHash() =>
    r'4571231014c26785c82873b227587bd888f944da';
