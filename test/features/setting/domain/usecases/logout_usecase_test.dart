import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/setting/domain/entities/logout.dart';
import 'package:litenet/features/setting/domain/repositories/setting_repository.dart';
import 'package:litenet/features/setting/domain/usecases/logout_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockSettingRepository extends Mock implements SettingRepository {}

void main() {
  late MockSettingRepository mockRepository;
  late LogoutUsecase usecase;

  setUp(() {
    mockRepository = MockSettingRepository();
    usecase = LogoutUsecase(mockRepository);
  });

  test('should return ProfileResponse on success', () async {
    final tResponse = LogoutResponse(success: true, message: 'ok');
    when(
      () => mockRepository.logout(),
    ).thenAnswer((_) async => Right(tResponse));
    final result = await usecase();
    expect(result, Right(tResponse));
  });

  test('should return Failure on error', () async {
    final failure = Failure(message: 'error');
    when(() => mockRepository.logout()).thenAnswer((_) async => Left(failure));
    final result = await usecase();
    expect(result, Left(failure));
  });
}
