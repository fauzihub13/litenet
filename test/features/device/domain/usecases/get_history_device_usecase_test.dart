import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/device/domain/entities/history_device.dart';
import 'package:litenet/features/device/domain/repositories/device_repository.dart';
import 'package:litenet/features/device/domain/usecases/get_history_device_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockDeviceRepository extends Mock implements DeviceRepository {}

void main() {
  late MockDeviceRepository mockRepository;

  late GetHistoryDeviceUsecase getHistoryDeviceUsecase;

  setUp(() {
    mockRepository = MockDeviceRepository();

    getHistoryDeviceUsecase = GetHistoryDeviceUsecase(mockRepository);
  });

  const tDeviceId = 'DEVICE-001';
  final tHistoryDeviceResponse = HistoryDeviceResponse(
    success: true,
    message: 'Success',
    data: [],
  );
  group('GetHistoryDeviceUsecase', () {
    test('should call getHistoryDevice from repository', () async {
      // arrange
      when(
        () => mockRepository.getHistoryDevice(deviceId: tDeviceId),
      ).thenAnswer((_) async => Right(tHistoryDeviceResponse));

      // act
      final result = await getHistoryDeviceUsecase(deviceId: tDeviceId);

      // assert
      expect(result, Right(tHistoryDeviceResponse));
      verify(
        () => mockRepository.getHistoryDevice(deviceId: tDeviceId),
      ).called(1);
    });

    test('should return Failure from repository when check fails', () async {
      // arrange
      final tFailure = Failure(message: 'Network error');
      when(
        () => mockRepository.getHistoryDevice(deviceId: tDeviceId),
      ).thenAnswer((_) async => Left(tFailure));

      // act
      final result = await getHistoryDeviceUsecase(deviceId: tDeviceId);

      // assert
      expect(result, Left(tFailure));
    });
  });
}
