import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/data/datasources/auth_datasource.dart';
import 'package:litenet/features/auth/data/mappers/login_mapper.dart';
import 'package:litenet/features/auth/data/models/login_model.dart';
import 'package:litenet/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthDatasource extends Mock implements AuthDatasource {}

void main() {
  late MockAuthDatasource mockDatasource;
  late AuthRepositoryImpl repository;

  setUp(() {
    mockDatasource = MockAuthDatasource();
    repository = AuthRepositoryImpl(authDatasource: mockDatasource);
  });

  group('login', () {
    const tEmail = 'test@email.com';
    const tPassword = 'password123';
    final tUserModel = UserModel(
      id: '1',
      name: 'Test',
      avatar: '',
      email: tEmail,
      phoneNumber: '08123456789',
      role: 'user',
      emailOtp: '',
      emailOtpExpiredAt: DateTime(2023, 1, 1),
      emailVerifiedAt: DateTime(2023, 1, 1),
      createdAt: DateTime(2023, 1, 1),
      updatedAt: DateTime(2023, 1, 1),
      deletedAt: DateTime(2023, 1, 1),
    );
    // final tLoginDataModel = LoginDataModel(
    //   user: tUserModel,
    //   isVerified: true,
    //   token: 'token',
    // );
    // final tLoginModel = LoginResponseModel(
    //   success: true,
    //   message: 'Success',
    //   data: tLoginDataModel,
    // );
    final tLoginEntity = LoginResponse(
      success: true,
      message: 'Success',
      data: LoginDataEntity(
        user: tUserModel.toEntity(),
        isVerified: true,
        token: 'token',
      ),
    );

    test(
      'should return LoginResponse entity when datasource returns model with success',
      () async {
        when(
          () => mockDatasource.login(email: tEmail, password: tPassword),
        ).thenAnswer((_) async => tLoginEntity);

        final result = await repository.login(
          email: tEmail,
          password: tPassword,
        );

        expect(result, Right(tLoginEntity));
        verify(
          () => mockDatasource.login(email: tEmail, password: tPassword),
        ).called(1);
      },
    );

    test('should return Failure when datasource throws', () async {
      when(
        () => mockDatasource.login(email: tEmail, password: tPassword),
      ).thenThrow(Exception('error'));

      final result = await repository.login(email: tEmail, password: tPassword);

      expect(result.isLeft(), true);
      verify(
        () => mockDatasource.login(email: tEmail, password: tPassword),
      ).called(1);
    });

    test(
      'should return Failure when datasource returns model with !success',
      () async {
        final tFailEntity = LoginResponse(
          success: false,
          message: 'Failed',
          data: LoginDataEntity(
            user: tUserModel.toEntity(),
            isVerified: false,
            token: '',
          ),
        );
        when(
          () => mockDatasource.login(email: tEmail, password: tPassword),
        ).thenAnswer((_) async => tFailEntity);

        final result = await repository.login(
          email: tEmail,
          password: tPassword,
        );

        result.fold((failure) {
          expect(failure, isA<Failure>());
          expect(failure.message, 'Failed');
        }, (_) => fail('Should not be success'));
        verify(
          () => mockDatasource.login(email: tEmail, password: tPassword),
        ).called(1);
      },
    );
  });
}
