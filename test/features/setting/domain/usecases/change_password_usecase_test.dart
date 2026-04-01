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

  setUp(() {
    mockRepository = MockSettingRepository();
    usecase = ChangePasswordUsecase(mockRepository);
  });

  test('should return ChangePasswordResponse on success', () async {
    final tResponse = ChangePasswordResponse(success: true, message: 'ok');
    when(
      () => mockRepository.changePassword(
        oldPassword: 'old',
        newPassword: 'new',
        confirmNewPassword: 'new',
      ),
    ).thenAnswer((_) async => Right(tResponse));
    final result = await usecase(
      oldPassword: 'old',
      newPassword: 'new',
      confirmNewPassword: 'new',
    );
    expect(result, Right(tResponse));
  });

  test('should return Failure on error', () async {
    final failure = Failure(message: 'error');
    when(
      () => mockRepository.changePassword(
        oldPassword: 'old',
        newPassword: 'new',
        confirmNewPassword: 'new',
      ),
    ).thenAnswer((_) async => Left(failure));
    final result = await usecase(
      oldPassword: 'old',
      newPassword: 'new',
      confirmNewPassword: 'new',
    );
    expect(result, Left(failure));
  });
}
