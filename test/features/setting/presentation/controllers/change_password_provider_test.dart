import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/setting/data/di/usecase_provider.dart';
import 'package:litenet/features/setting/domain/entities/change_password.dart';
import 'package:litenet/features/setting/domain/usecases/change_password_provider.dart';
import 'package:litenet/features/setting/presentation/controllers/change_password_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockChangePasswordUsecase extends Mock implements ChangePasswordUsecase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockChangePasswordUsecase mockUsecase;
  late ProviderContainer container;

  final tResponse = ChangePasswordResponse(
    success: true,
    message: 'Password changed successfully',
  );

  final tFailure = Failure(message: 'Invalid old password');

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<ChangePasswordResponse?>());
    registerFallbackValue(AsyncData<ChangePasswordResponse?>(tResponse));
  });

  setUp(() {
    mockUsecase = MockChangePasswordUsecase();
    container = ProviderContainer(
      overrides: [
        changePasswordUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('ChangePasswordProvider', () {
    test('initial state should eventually be AsyncData(null)', () async {
      final state = await container.read(changePasswordProvider.future);
      expect(state, null);
    });

    test('should emit AsyncLoading and then AsyncData on success', () async {
      // arrange
      when(() => mockUsecase.call(
            oldPassword: any(named: 'oldPassword'),
            newPassword: any(named: 'newPassword'),
            confirmNewPassword: any(named: 'confirmNewPassword'),
          )).thenAnswer((_) async => Right(tResponse));

      // Wait for build
      await container.read(changePasswordProvider.future);

      final listener = Listener<AsyncValue<ChangePasswordResponse?>>();
      container.listen(changePasswordProvider, listener.call, fireImmediately: true);

      final notifier = container.read(changePasswordProvider.notifier);

      // act
      await notifier.changePassword(
        oldPassword: 'old_password_123',
        newPassword: 'new_password_123',
        confirmNewPassword: 'new_password_123',
      );

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<ChangePasswordResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), AsyncData<ChangePasswordResponse?>(tResponse)),
      ]);

      verify(() => mockUsecase.call(
            oldPassword: 'old_password_123',
            newPassword: 'new_password_123',
            confirmNewPassword: 'new_password_123',
          )).called(1);
    });

    test('should emit AsyncError on failure', () async {
      // arrange
      when(() => mockUsecase.call(
            oldPassword: any(named: 'oldPassword'),
            newPassword: any(named: 'newPassword'),
            confirmNewPassword: any(named: 'confirmNewPassword'),
          )).thenAnswer((_) async => Left(tFailure));

      // Wait for build
      await container.read(changePasswordProvider.future);

      final listener = Listener<AsyncValue<ChangePasswordResponse?>>();
      container.listen(changePasswordProvider, listener.call, fireImmediately: true);

      final notifier = container.read(changePasswordProvider.notifier);

      // act
      await notifier.changePassword(
        oldPassword: 'wrong_password',
        newPassword: 'new_password_123',
        confirmNewPassword: 'new_password_123',
      );

      // assert
      verifyInOrder([
        () => listener(any(), const AsyncData<ChangePasswordResponse?>(null)),
        () => listener(any(), any(that: isA<AsyncLoading>())),
        () => listener(any(), any(that: isA<AsyncError>())),
      ]);

      final finalState = container.read(changePasswordProvider);
      expect(finalState, isA<AsyncError>());
      expect(finalState.error, tFailure);
    });
  });
}
