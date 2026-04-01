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

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockChangePasswordUsecase mockUsecase;
  late ProviderContainer container;

  setUp(() {
    mockUsecase = MockChangePasswordUsecase();
    container = ProviderContainer(
      overrides: [changePasswordUsecaseProvider.overrideWithValue(mockUsecase)],
    );
  });

  test('should emit loading and then data on success', () async {
    final tResponse = ChangePasswordResponse(success: true, message: 'ok');
    when(() => mockUsecase(
      oldPassword: 'old',
      newPassword: 'new',
      confirmNewPassword: 'new',
    )).thenAnswer((_) async => Right(tResponse));
    final notifier = container.read(changePasswordProvider.notifier);
    final future = notifier.changePassword(
      oldPassword: 'old',
      newPassword: 'new',
      confirmNewPassword: 'new',
    );
    expect(container.read(changePasswordProvider), isA<AsyncLoading>());
    await future;
    ChangePasswordResponse? value;
    for (var i = 0; i < 100; i++) {
      final state = container.read(changePasswordProvider);
      if (!state.isLoading) {
        value = state.value;
        break;
      }
      await Future.delayed(const Duration(milliseconds: 10));
    }
    expect(value, isNotNull);
    expect(value, tResponse);
  });

  test('should emit loading and then error on failure', () async {
    when(() => mockUsecase(
      oldPassword: 'old',
      newPassword: 'new',
      confirmNewPassword: 'new',
    )).thenAnswer((_) async => Left(Failure(message: 'error')));
    final notifier = container.read(changePasswordProvider.notifier);
    final future = notifier.changePassword(
      oldPassword: 'old',
      newPassword: 'new',
      confirmNewPassword: 'new',
    );
    expect(container.read(changePasswordProvider), isA<AsyncLoading>());
    await future;
    expect(container.read(changePasswordProvider).hasError, true);
  });
}
