class DetailQuotaResponse {
  final bool success;
  final String message;
  final DetailQuotaDataEntity data;

  const DetailQuotaResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}

class DetailQuotaDataEntity {
  final String id;
  final String code;
  final String slug;
  final String name;
  final int quota;
  final int monthDuration;
  final String description;
  final int basePrice;
  final int promoPrice;
  final int discount;
  final String capacity;
  final bool isPromo;
  final List<String> terms;
  final List<DeviceQuotaDataEntity> devices;

  const DetailQuotaDataEntity({
    required this.id,
    required this.code,
    required this.slug,
    required this.name,
    required this.quota,
    required this.monthDuration,
    required this.description,
    required this.basePrice,
    required this.promoPrice,
    required this.discount,
    required this.capacity,
    required this.isPromo,
    required this.terms,
    required this.devices,
  });
}

class DeviceQuotaDataEntity {
  final String id;
  final String name;

  const DeviceQuotaDataEntity({required this.id, required this.name});
}
