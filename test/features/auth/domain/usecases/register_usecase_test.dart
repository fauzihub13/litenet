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

  final tRegisterResponse = RegisterResponse(
    success: true,
    message: 'Registration successful',
  );

  final tParams = {
    'name': 'Test User',
    'email': 'test@example.com',
    'password': 'password123',
    'passwordConfirmation': 'password123',
    'phoneNumber': '08123456789',
  };

  setUp(() {
    mockRepository = MockAuthRepository();
    usecase = RegisterUsecase(mockRepository);
  });

  group('RegisterUsecase', () {
    test('should call register from repository with correct parameters', () async {
      // arrange
      when(
        () => mockRepository.register(
          name: any(named: 'name'),
          email: any(named: 'email'),
          password: any(named: 'password'),
          passwordConfirmation: any(named: 'passwordConfirmation'),
          phoneNumber: any(named: 'phoneNumber'),
        ),
      ).thenAnswer((_) async => Right(tRegisterResponse));

      // act
      final result = await usecase(
        name: tParams['name']!,
        email: tParams['email']!,
        password: tParams['password']!,
        passwordConfirmation: tParams['passwordConfirmation']!,
        phoneNumber: tParams['phoneNumber']!,
      );

      // assert
      expect(result, Right(tRegisterResponse));
      verify(
        () => mockRepository.register(
          name: tParams['name']!,
          email: tParams['email']!,
          password: tParams['password']!,
          passwordConfirmation: tParams['passwordConfirmation']!,
          phoneNumber: tParams['phoneNumber']!,
        ),
      ).called(1);
    });

    test('should return Failure from repository when registration fails', () async {
      // arrange
      final tFailure = Failure(message: 'Registration failed');
      when(
        () => mockRepository.register(
          name: any(named: 'name'),
          email: any(named: 'email'),
          password: any(named: 'password'),
          passwordConfirmation: any(named: 'passwordConfirmation'),
          phoneNumber: any(named: 'phoneNumber'),
        ),
      ).thenAnswer((_) async => Left(tFailure));

      // act
      final result = await usecase(
        name: tParams['name']!,
        email: tParams['email']!,
        password: tParams['password']!,
        passwordConfirmation: tParams['passwordConfirmation']!,
        phoneNumber: tParams['phoneNumber']!,
      );

      // assert
      expect(result, Left(tFailure));
      verify(
        () => mockRepository.register(
          name: tParams['name']!,
          email: tParams['email']!,
          password: tParams['password']!,
          passwordConfirmation: tParams['passwordConfirmation']!,
          phoneNumber: tParams['phoneNumber']!,
        ),
      ).called(1);
    });
  });
}
