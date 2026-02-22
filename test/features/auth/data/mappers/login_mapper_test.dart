import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/features/auth/data/models/login_model.dart';
import 'package:litenet/features/auth/data/mappers/login_mapper.dart';

void main() {
  group('LoginMapper Test', () {
    test('should map full LoginResponseModel to LoginResponse Entity', () {
      final model = LoginResponseModel(
        success: true,
        message: 'Login berhasil',
        data: LoginDataModel(
          token: 'token123',
          user: UserModel(
            id: '1',
            name: 'Fauzi',
            avatar: 'avatar.png',
            email: 'fauzi@mail.com',
            phoneNumber: '08999',
            role: 'admin',
            emailOtp: '123456',
            emailOtpExpiredAt: DateTime(2026, 1, 1),
            emailVerifiedAt: DateTime(2026, 1, 1),
            createdAt: DateTime(2026, 1, 1),
            updatedAt: DateTime(2026, 1, 1),
            deletedAt: DateTime(2026, 1, 1),
          ),
        ),
      );

      final entity = model.toEntity();

      expect(entity.success, true);
      expect(entity.message, 'Login berhasil');
      expect(entity.data.token, 'token123');
      expect(entity.data.user.name, 'Fauzi');
      expect(entity.data.user.email, 'fauzi@mail.com');
    });

    test('should handle null values and return default', () {
      final model = LoginResponseModel(
        success: null,
        message: null,
        data: LoginDataModel(token: null, user: UserModel()),
      );

      final entity = model.toEntity();

      expect(entity.success, false);
      expect(entity.message, '-');
      expect(entity.data.token, '-');
      expect(entity.data.user.name, '-');
      expect(entity.data.user.email, '-');
    });

    test('should handle null user object', () {
      final model = LoginResponseModel(
        success: true,
        message: 'ok',
        data: LoginDataModel(token: '123', user: null),
      );

      final entity = model.toEntity();

      expect(entity.data.user.name, '-');
      expect(entity.data.user.email, '-');
    });

    test('should handle null data object', () {
      final model = LoginResponseModel(
        success: true,
        message: 'ok',
        data: null,
      );

      final entity = model.toEntity();

      expect(entity.data.token, '-');
      expect(entity.data.user.name, '-');
    });
  });
}
