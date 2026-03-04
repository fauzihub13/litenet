import 'package:dio/dio.dart';
import 'package:litenet/features/promo/data/mappers/promo_mapper.dart';
import 'package:litenet/features/promo/data/models/promo_model.dart';
import 'package:litenet/features/promo/domain/entities/promo.dart';

abstract class PromoDatasource {
  Future<PromoResponse> getPromo();
}

class PromoDatasourceImpl implements PromoDatasource {
  final Dio httpClient;

  PromoDatasourceImpl({required this.httpClient});

  @override
  Future<PromoResponse> getPromo() async {
    String url = '/promotions';
    final response = await httpClient.get(url);

    final data = PromoResponseModel.fromJson(response.data);
    return data.toEntity();
  }
}
