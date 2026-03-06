import 'package:litenet/features/promo/domain/entities/promo.dart';

class CheckPromoResponse {
  final bool success;
  final String message;
  final PromoDataEntity data;

  const CheckPromoResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}
