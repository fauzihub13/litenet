import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/register.dart';
import 'package:litenet/features/auth/domain/repositories/auth_repository.dart';
import 'package:litenet/features/auth/domain/usecases/register_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockRepository;
  late RegisterUsecase usecase;

  setUp(() {
    mockRepository = MockAuthRepository();
    usecase = RegisterUsecase(mockRepository);
  });

  test('should return RegisterResponse on success', () async {
    final tRegisterResponse = RegisterResponse(success: true, message: 'ok');
    when(
      () => mockRepository.register(
        name: 'Test',
        email: 'a',
        password: 'b',
        passwordConfirmation: 'b',
        phoneNumber: '123',
      ),
    ).thenAnswer((_) async => Right(tRegisterResponse));

    final result = await usecase(
      name: 'Test',
      email: 'a',
      password: 'b',
      passwordConfirmation: 'b',
      phoneNumber: '123',
    );
    expect(result, Right(tRegisterResponse));
  });

  test('should return Failure on error', () async {
    when(
      () => mockRepository.register(
        name: 'Test',
        email: 'a',
        password: 'b',
        passwordConfirmation: 'b',
        phoneNumber: '123',
      ),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));

    final result = await usecase(
      name: 'Test',
      email: 'a',
      password: 'b',
      passwordConfirmation: 'b',
      phoneNumber: '123',
    );
    expect(result.isLeft(), true);
  });
}
