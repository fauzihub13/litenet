import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/data/di/usecase_provider.dart';
import 'package:litenet/features/auth/domain/entities/register.dart';
import 'package:litenet/features/auth/domain/usecases/register_usecase.dart';
import 'package:litenet/features/auth/presentation/controllers/register_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterUsecase extends Mock implements RegisterUsecase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockRegisterUsecase mockRegisterUsecase;
  late ProviderContainer container;

  setUp(() {
    mockRegisterUsecase = MockRegisterUsecase();
    container = ProviderContainer(
      overrides: [
        registerUsecaseProvider.overrideWithValue(mockRegisterUsecase),
      ],
    );
  });

  test('should emit loading and then data on success', () async {
    final tRegisterResponse = RegisterResponse(
      success: true,
      message: 'ok',
    );
    when(
      () => mockRegisterUsecase(
        name: 'Test',
        email: 'a',
        password: 'b',
        passwordConfirmation: 'b',
        phoneNumber: '123',
      ),
    ).thenAnswer((_) async => Right(tRegisterResponse));

    final notifier = container.read(registerProvider.notifier);
    final future = notifier.register(
      name: 'Test',
      email: 'a',
      password: 'b',
      passwordConfirmation: 'b',
      phoneNumber: '123',
    );
    expect(container.read(registerProvider), isA<AsyncLoading>());
    await future;
    RegisterResponse? value;
    for (var i = 0; i < 100; i++) {
      final state = container.read(registerProvider);
      if (!state.isLoading) {
        value = state.value;
        break;
      }
      await Future.delayed(const Duration(milliseconds: 10));
    }
    expect(value, isNotNull);
    expect(value, tRegisterResponse);
  });

  test('should emit loading and then error on failure', () async {
    when(
      () => mockRegisterUsecase(
        name: 'Test',
        email: 'a',
        password: 'b',
        passwordConfirmation: 'b',
        phoneNumber: '123',
      ),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));

    final notifier = container.read(registerProvider.notifier);
    final future = notifier.register(
      name: 'Test',
      email: 'a',
      password: 'b',
      passwordConfirmation: 'b',
      phoneNumber: '123',
    );
    expect(container.read(registerProvider), isA<AsyncLoading>());
    await future;
    expect(container.read(registerProvider).hasError, true);
  });
}
