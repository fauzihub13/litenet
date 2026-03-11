import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/auth/domain/repositories/auth_repository.dart';
import 'package:litenet/features/auth/domain/usecases/login_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late LoginUsecase usecase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = LoginUsecase(mockAuthRepository);
  });

  test('should return LoginResponse when repository returns success', () async {
    final tLoginResponse = LoginResponse(
      success: true,
      message: 'ok',
      data: LoginDataEntity(
        user: User(
          id: '1',
          name: 'Test',
          avatar: '',
          email: 'a',
          phoneNumber: '',
          role: '',
          emailOtp: '',
          emailOtpExpiredAt: DateTime.now(),
          emailVerifiedAt: DateTime.now(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: DateTime.now(),
        ),
        isVerified: true,
        token: 'token',
      ),
    );
    when(
      () => mockAuthRepository.login(email: 'a', password: 'b'),
    ).thenAnswer((_) async => Right(tLoginResponse));

    final result = await usecase(email: 'a', password: 'b');
    expect(result, Right(tLoginResponse));
  });

  test('should return Failure when repository returns failure', () async {
    when(
      () => mockAuthRepository.login(email: 'a', password: 'b'),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));

    final result = await usecase(email: 'a', password: 'b');
   result.fold((failure) {
      expect(failure, isA<Failure>());
      expect(failure.message, 'error'); // atau 'Failed' sesuai test
    }, (_) => fail('Should not be success'));
  });
}
