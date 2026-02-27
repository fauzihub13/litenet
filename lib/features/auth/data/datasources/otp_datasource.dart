import 'package:dio/dio.dart';
import 'package:litenet/features/auth/data/mappers/otp_mapper.dart';
import 'package:litenet/features/auth/data/models/otp_model.dart';
import 'package:litenet/features/auth/domain/entities/otp.dart';

abstract class OTPDatasource {
  Future<OTPResponse> verifyOTP({required String email, required String otp});
  Future<OTPResponse> resendOTP({required String email});
}

class OTPDatasourceImpl extends OTPDatasource {
  final Dio httpClient;
  OTPDatasourceImpl({required this.httpClient});

  @override
  Future<OTPResponse> resendOTP({required String email}) async {
    String url = '/resend-otp';
    final response = await httpClient.post(url, data: {'email': email});

    final data = OTPResponseModel.fromJson(response.data);
    return data.toEntity();
  }

  @override
  Future<OTPResponse> verifyOTP({
    required String email,
    required String otp,
  }) async {
    String url = '/verify-otp';
    final response = await httpClient.post(
      url,
      data: {'email': email, 'otp': otp},
    );

    final data = OTPResponseModel.fromJson(response.data);
    return data.toEntity();
  }
}
