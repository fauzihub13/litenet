import 'package:dio/dio.dart';
import 'package:litenet/features/quota/data/mappers/check_promo_mapper.dart';
import 'package:litenet/features/quota/data/mappers/detail_quota_mapper.dart';
import 'package:litenet/features/quota/data/mappers/quota_mapper.dart';
import 'package:litenet/features/quota/data/models/check_promo_model.dart';
import 'package:litenet/features/quota/data/models/detail_quota_model.dart';
import 'package:litenet/features/quota/data/models/quota_model.dart';
import 'package:litenet/features/quota/domain/entities/check_promo.dart';
import 'package:litenet/features/quota/domain/entities/detail_quota.dart';
import 'package:litenet/features/quota/domain/entities/quota.dart';

abstract class QuotaDatasource {
  Future<QuotaResponse> getAllQuotas();
  Future<DetailQuotaResponse> getDetailQuota({required String id});
  Future<CheckPromoResponse> checkPromoCode({
    required String dataPlanId,
    required String promoCode,
  });
}

class QuotaDatasourceImpl extends QuotaDatasource {
  final Dio httpClient;
  QuotaDatasourceImpl({required this.httpClient});

  @override
  Future<QuotaResponse> getAllQuotas() async {
    String url = '/data-plans';
    final response = await httpClient.get(url);

    final data = QuotaResponseModel.fromJson(response.data);
    return data.toEntity();
  }

  @override
  Future<DetailQuotaResponse> getDetailQuota({required String id}) async {
    String url = '/data-plans/$id';
    final response = await httpClient.get(url);

    final data = DetailQuotaResponseModel.fromJson(response.data);
    return data.toEntity();
  }

  @override
  Future<CheckPromoResponse> checkPromoCode({
    required String dataPlanId,
    required String promoCode,
  }) async {
    String url = '/transactions/check-promo-code';
    final response = await httpClient.post(
      url,
      data: {"data_plan_id": dataPlanId, "promo_code": promoCode},
    );

    final data = CheckPromoResponseModel.fromJson(response.data);
    return data.toEntity();
  }
}
