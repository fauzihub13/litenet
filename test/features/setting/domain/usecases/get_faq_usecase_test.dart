import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/setting/domain/entities/faq.dart';
import 'package:litenet/features/setting/domain/repositories/setting_repository.dart';
import 'package:litenet/features/setting/domain/usecases/get_faq_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockSettingRepository extends Mock implements SettingRepository {}

void main() {
  late MockSettingRepository mockRepository;
  late GetFAQUsecase usecase;

  setUp(() {
    mockRepository = MockSettingRepository();
    usecase = GetFAQUsecase(mockRepository);
  });

  test('should return FAQResponse on success', () async {
    final tResponse = FAQResponse(success: true, message: 'ok', data: []);
    when(
      () => mockRepository.getFAQ(),
    ).thenAnswer((_) async => Right(tResponse));
    final result = await usecase();
    expect(result, Right(tResponse));
  });

  test('should return Failure on error', () async {
    final failure = Failure(message: 'error');
    when(() => mockRepository.getFAQ()).thenAnswer((_) async => Left(failure));
    final result = await usecase();
    expect(result, Left(failure));
  });
}
