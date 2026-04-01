import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/setting/domain/entities/profile.dart';
import 'package:litenet/features/setting/domain/repositories/setting_repository.dart';
import 'package:litenet/features/setting/domain/usecases/change_profile_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockSettingRepository extends Mock implements SettingRepository {}

void main() {
  late MockSettingRepository mockRepository;
  late ChangeProfileUsecase usecase;

  setUp(() {
    mockRepository = MockSettingRepository();
    usecase = ChangeProfileUsecase(mockRepository);
  });

  test('should return ProfileResponse on success', () async {
    final tResponse = ProfileResponse(
      success: true,
      message: 'ok',
      data: User(
        id: "USR-0000",
        name: "Dummy User",
        avatar: "https://dummyimage.com/100x100/000/fff.png",
        email: "dummy@example.com",
        phoneNumber: "081234567890",
        role: "guest",
        emailOtp: "000000",
        emailOtpExpiredAt: DateTime.now().add(const Duration(minutes: 5)),
        emailVerifiedAt: DateTime.now(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: DateTime(1970, 1, 1),
      ),
    );
    when(
      () => mockRepository.changeProfile(
        name: 'old',
        email: 'new',
        phoneNumber: 'new',
      ),
    ).thenAnswer((_) async => Right(tResponse));
    final result = await usecase(name: 'old', email: 'new', phoneNumber: 'new');
    expect(result, Right(tResponse));
  });

  test('should return Failure on error', () async {
    final failure = Failure(message: 'error');
    when(
      () => mockRepository.changeProfile(
        name: 'old',
        email: 'new',
        phoneNumber: 'new',
      ),
    ).thenAnswer((_) async => Left(failure));
    final result = await usecase(name: 'old', email: 'new', phoneNumber: 'new');
    expect(result, Left(failure));
  });
}
