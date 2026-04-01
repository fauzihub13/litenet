import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/provider/token_manager_provider.dart';
import 'package:litenet/features/auth/data/di/usecase_provider.dart';
import 'package:litenet/features/auth/domain/entities/login.dart';
import 'package:litenet/features/auth/domain/usecases/login_usecase.dart';
import 'package:litenet/features/auth/presentation/controllers/login_provider.dart';
import 'package:litenet/features/auth/presentation/controllers/user_manager_provider.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockLoginUsecase extends Mock implements LoginUsecase {}

class MockTokenManager extends TokenManager {
  MockTokenManager({required SharedPreferences sharedPreferences})
    : super(sharedPreferences: sharedPreferences);
}

class MockUserManager extends UserManager {
  MockUserManager({required SharedPreferences sharedPreferences})
    : super(sharedPreferences: sharedPreferences);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockLoginUsecase mockLoginUsecase;
  late ProviderContainer container;
  late MockTokenManager mockTokenManager;
  late MockUserManager mockUserManager;

  setUp(() async {
    mockLoginUsecase = MockLoginUsecase();
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    mockTokenManager = MockTokenManager(sharedPreferences: prefs);
    mockUserManager = MockUserManager(sharedPreferences: prefs);
    // Tidak perlu when() untuk saveToken/saveUser karena bukan mocktail mock
    container = ProviderContainer(
      overrides: [
        loginUsecaseProvider.overrideWithValue(mockLoginUsecase),
        tokenManagerProvider.overrideWith((_) => mockTokenManager),
        userManagerProvider.overrideWith((_) => mockUserManager),
      ],
    );
  });

  test('should emit loading and then data on success', () async {
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
      () => mockLoginUsecase(email: 'a', password: 'b'),
    ).thenAnswer((_) async => Right(tLoginResponse));

    final notifier = container.read(loginProvider.notifier);

    final future = notifier.login(email: 'a', password: 'b');
    expect(container.read(loginProvider), isA<AsyncLoading>());
    await future;
    // polling state sampai bukan loading (maksimal 2 detik)
    LoginResponse? value;
    for (var i = 0; i < 200; i++) {
      final state = container.read(loginProvider);
      if (!state.isLoading) {
        value = state.value;
        break;
      }
      await Future.delayed(const Duration(milliseconds: 10));
    }
    print(value);
    expect(
      value,
      isNotNull,
      reason: 'LoginResponse seharusnya tidak null setelah login sukses',
    );
    expect(value, tLoginResponse);
  });

  test('should emit loading and then error on failure', () async {
    when(
      () => mockLoginUsecase(email: 'a', password: 'b'),
    ).thenAnswer((_) async => Left(Failure(message: 'error')));

    final notifier = container.read(loginProvider.notifier);

    final future = notifier.login(email: 'a', password: 'b');
    expect(container.read(loginProvider), isA<AsyncLoading>());
    await future;
    expect(container.read(loginProvider).hasError, true);
  });
}
