import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/domain/entities/topup_history_device.dart';
import 'package:litenet/features/device/domain/repositories/device_repository.dart';
import 'package:litenet/features/device/domain/usecases/get_topup_hisotry_device_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockDeviceRepository extends Mock implements DeviceRepository {}

void main() {
  late MockDeviceRepository mockRepository;
  late GetTopupHistoryDeviceUsecase getTopupHistoryDeviceUsecase;

  setUp(() {
    mockRepository = MockDeviceRepository();

    getTopupHistoryDeviceUsecase = GetTopupHistoryDeviceUsecase(mockRepository);
  });

  const tDeviceId = 'DEVICE-001';

  final tTopupHistoryDeviceResponse = TopupHistoryDeviceResponse(
    success: true,
    message: 'Success',
    data: [],
  );

  group('GetTopupHistoryDeviceUsecase', () {
    test('should call getTopupHistoryDevice from repository', () async {
      // arrange
      when(
        () => mockRepository.getTopupHistoryDevice(deviceId: tDeviceId),
      ).thenAnswer((_) async => Right(tTopupHistoryDeviceResponse));

      // act
      final result = await getTopupHistoryDeviceUsecase(deviceId: tDeviceId);

      // assert
      expect(result, Right(tTopupHistoryDeviceResponse));
      verify(
        () => mockRepository.getTopupHistoryDevice(deviceId: tDeviceId),
      ).called(1);
    });

    test('should return Failure from repository when check fails', () async {
      // arrange
      final tFailure = Failure(message: 'Network error');
      when(
        () => mockRepository.getTopupHistoryDevice(deviceId: tDeviceId),
      ).thenAnswer((_) async => Left(tFailure));

      // act
      final result = await getTopupHistoryDeviceUsecase(deviceId: tDeviceId);

      // assert
      expect(result, Left(tFailure));
    });
  });
}
