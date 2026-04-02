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

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockRegisterUsecase mockRegisterUsecase;
  late ProviderContainer container;

  final tRegisterResponse = RegisterResponse(
    success: true,
    message: 'Registration successful',
  );

  final tFailure = Failure(message: 'Email already exists');

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<RegisterResponse?>());
    registerFallbackValue(AsyncData<RegisterResponse?>(tRegisterResponse));
  });

  setUp(() {
    mockRegisterUsecase = MockRegisterUsecase();
    container = ProviderContainer(
      overrides: [
        registerUsecaseProvider.overrideWithValue(mockRegisterUsecase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('RegisterProvider', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(registerProvider.future);
      expect(state, null);
    });

    test('should emit AsyncLoading and then AsyncData on successful registration', () async {
      // arrange
      when(
        () => mockRegisterUsecase.call(
          name: any(named: 'name'),
          email: any(named: 'email'),
          password: any(named: 'password'),
          passwordConfirmation: any(named: 'passwordConfirmation'),
          phoneNumber: any(named: 'phoneNumber'),
        ),
      ).thenAnswer((_) async => Right(tRegisterResponse));

      // Wait for build to finish
      await container.read(registerProvider.future);

      final listener = Listener<AsyncValue<RegisterResponse?>>();
      container.listen(
        registerProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(registerProvider.notifier);

      // act
      await notifier.register(
        name: 'Test User',
        email: 'test@example.com',
        password: 'password123',
        passwordConfirmation: 'password123',
        phoneNumber: '08123456789',
      );

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<RegisterResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<RegisterResponse?>(tRegisterResponse)),
      ]);

      verify(
        () => mockRegisterUsecase.call(
          name: 'Test User',
          email: 'test@example.com',
          password: 'password123',
          passwordConfirmation: 'password123',
          phoneNumber: '08123456789',
        ),
      ).called(1);
    });

    test('should emit AsyncError on failed registration', () async {
      // arrange
      when(
        () => mockRegisterUsecase.call(
          name: any(named: 'name'),
          email: any(named: 'email'),
          password: any(named: 'password'),
          passwordConfirmation: any(named: 'passwordConfirmation'),
          phoneNumber: any(named: 'phoneNumber'),
        ),
      ).thenAnswer((_) async => Left(tFailure));

      // Wait for build to finish
      await container.read(registerProvider.future);

      final listener = Listener<AsyncValue<RegisterResponse?>>();
      container.listen(
        registerProvider,
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(registerProvider.notifier);

      // act
      await notifier.register(
        name: 'Test User',
        email: 'test@example.com',
        password: 'password123',
        passwordConfirmation: 'password123',
        phoneNumber: '08123456789',
      );

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<RegisterResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(registerProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
