import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/setting/domain/entities/change_password.dart';
import 'package:litenet/features/setting/domain/repositories/setting_repository.dart';
import 'package:litenet/features/setting/domain/usecases/change_password_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockSettingRepository extends Mock implements SettingRepository {}

void main() {
  late MockSettingRepository mockRepository;
  late ChangePasswordUsecase usecase;

  final tResponse = ChangePasswordResponse(
    success: true,
    message: 'Password changed successfully',
  );

  setUp(() {
    mockRepository = MockSettingRepository();
    usecase = ChangePasswordUsecase(mockRepository);
  });

  group('ChangePasswordUsecase', () {
    test('should call changePassword from repository with correct parameters', () async {
      // arrange
      when(() => mockRepository.changePassword(
            oldPassword: any(named: 'oldPassword'),
            newPassword: any(named: 'newPassword'),
            confirmNewPassword: any(named: 'confirmNewPassword'),
          )).thenAnswer((_) async => Right(tResponse));

      // act
      final result = await usecase(
        oldPassword: 'old_password_123',
        newPassword: 'new_password_123',
        confirmNewPassword: 'new_password_123',
      );

      // assert
      expect(result, Right(tResponse));
      verify(() => mockRepository.changePassword(
            oldPassword: 'old_password_123',
            newPassword: 'new_password_123',
            confirmNewPassword: 'new_password_123',
          )).called(1);
    });

    test('should return Failure from repository when change fails', () async {
      // arrange
      final tFailure = Failure(message: 'Incorrect old password');
      when(() => mockRepository.changePassword(
            oldPassword: any(named: 'oldPassword'),
            newPassword: any(named: 'newPassword'),
            confirmNewPassword: any(named: 'confirmNewPassword'),
          )).thenAnswer((_) async => Left(tFailure));

      // act
      final result = await usecase(
        oldPassword: 'wrong_password',
        newPassword: 'new_password_123',
        confirmNewPassword: 'new_password_123',
      );

      // assert
      expect(result, Left(tFailure));
    });
  });
}
