import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/features/auth/data/models/login_model.dart';

void main() {
  group('LoginResponseModel', () {
    test('fromJson should parse correctly', () {
      final json = {
        "success": true,
        "message": "Login berhasil",
        "data": {
          "user": {
            "id": "019c6cbd-6787-704c-b794-508f6bfcd029",
            "name": "Fauzi",
            "avatar": null,
            "email": "fauziadisaputra3@gmail.com",
            "phone_number": "089999222",
            "role": "admin",
            "email_otp": null,
            "email_otp_expired_at": null,
            "email_verified_at": "2026-02-17T17:55:04.000000Z",
            "created_at": "2026-02-17T17:54:38.000000Z",
            "updated_at": "2026-02-17T17:55:04.000000Z",
            "deleted_at": null,
          },
          "token": "2|BRAlcXo2bM4CFqcXDT9jdO7EeQ0JU2Fphh0mk33J46efbc89",
        },
      };

      final model = LoginResponseModel.fromJson(json);

      expect(model.success, true);
      expect(model.message, "Login berhasil");
      expect(
        model.data?.token,
        "2|BRAlcXo2bM4CFqcXDT9jdO7EeQ0JU2Fphh0mk33J46efbc89",
      );
      expect(model.data?.user?.id, "019c6cbd-6787-704c-b794-508f6bfcd029");
      expect(model.data?.user?.name, "Fauzi");
      expect(model.data?.user?.email, "fauziadisaputra3@gmail.com");
      expect(model.data?.user?.phoneNumber, "089999222");
      expect(model.data?.user?.role, "admin");
      expect(
        model.data?.user?.createdAt,
        DateTime.parse("2026-02-17T17:54:38.000000Z"),
      );
    });

    test('toJson should convert correctly', () {
      final user = UserModel(
        id: "123",
        name: "Test User",
        email: "test@example.com",
        phoneNumber: "08123456789",
        role: "admin",
        createdAt: DateTime.parse("2026-02-17T17:54:38.000000Z"),
        updatedAt: DateTime.parse("2026-02-17T17:55:04.000000Z"),
      );

      final data = LoginDataModel(user: user, token: "abc123");
      final response = LoginResponseModel(
        success: true,
        message: "OK",
        data: data,
      );

      final json = response.toJson();

      expect(json['success'], true);
      expect(json['message'], "OK");

      // akses nested object dengan toJson()
      final dataJson = (response.data?.toJson()) ?? {};
      expect(dataJson['token'], "abc123");

      final userJson = (response.data?.user?.toJson()) ?? {};
      expect(userJson['name'], "Test User");
      expect(userJson['email'], "test@example.com");
    });
  });
}
