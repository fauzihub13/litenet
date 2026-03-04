import 'package:dartz/dartz.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/features/setting/domain/entities/faq.dart';
import 'package:litenet/features/setting/domain/repositories/setting_repository.dart';

class GetFAQUsecase {
  final SettingRepository settingRepository;

  const GetFAQUsecase(this.settingRepository);

  Future<Either<Failure, FAQResponse>> call() async {
    return await settingRepository.getFAQ();
  }
}
