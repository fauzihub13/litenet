import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/setting/data/di/usecase_provider.dart';
import 'package:litenet/features/setting/domain/entities/profile.dart';
import 'package:litenet/features/setting/domain/usecases/get_profile_provider.dart';
import 'package:litenet/features/setting/presentation/controllers/get_profile_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockGetProfileUsecase extends Mock implements GetProfileUsecase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockGetProfileUsecase mockUsecase;
  late ProviderContainer container;

  setUp(() {
    mockUsecase = MockGetProfileUsecase();
    container = ProviderContainer(
      overrides: [getProfileUsecaseProvider.overrideWithValue(mockUsecase)],
    );
  });

  test('should return ProfileResponse on success', () async {
    final tResponse = ProfileResponse(
      success: true,
      message: 'ok',
      data: User(
        id: "USR-${DateTime.now().millisecondsSinceEpoch}", // ID unik dummy
        name: "Dummy User", // nama kosong
        avatar: "https://dummyimage.com/100x100/000/fff.png", // avatar dummy
        email: "dummy@example.com", // email dummy
        phoneNumber: "081234567890", // nomor dummy
        role: "guest", // role dummy
        emailOtp: "000000", // OTP dummy
        emailOtpExpiredAt: DateTime.now().add(
          const Duration(minutes: 5),
        ), // expired 5 menit
        emailVerifiedAt: DateTime.now(), // dianggap sudah diverifikasi
        createdAt: DateTime.now(), // waktu dibuat sekarang
        updatedAt: DateTime.now(), // waktu update sekarang
        deletedAt: DateTime(1970, 1, 1), // default kosong (epoch)
      ),
    );
    when(() => mockUsecase()).thenAnswer((_) async => Right(tResponse));
    final result = await container.read(getProfileProvider.future);
    expect(result, tResponse);
  });

  test('should throw StateError on error', () async {
    when(
      () => mockUsecase(),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));
    expect(
      () => container.read(getProfileProvider.future),
      throwsA(isA<StateError>()),
    );
  });
}
