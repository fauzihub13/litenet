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

  final tLogoutResponse = LogoutResponse(
    success: true,
    message: 'Logout successful',
  );

  setUp(() {
    mockRepository = MockSettingRepository();
    usecase = LogoutUsecase(mockRepository);
  });

  group('LogoutUsecase', () {
    test('should call logout from repository', () async {
      // arrange
      when(() => mockRepository.logout())
          .thenAnswer((_) async => Right(tLogoutResponse));

      // act
      final result = await usecase();

      // assert
      expect(result, Right(tLogoutResponse));
      verify(() => mockRepository.logout()).called(1);
    });

    test('should return Failure from repository when logout fails', () async {
      // arrange
      final tFailure = Failure(message: 'Logout failed');
      when(() => mockRepository.logout())
          .thenAnswer((_) async => Left(tFailure));

      // act
      final result = await usecase();

      // assert
      expect(result, Left(tFailure));
    });
  });
}
