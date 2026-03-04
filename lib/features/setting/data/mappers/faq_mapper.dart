import 'package:litenet/features/setting/data/models/faq_model.dart';
import 'package:litenet/features/setting/domain/entities/faq.dart';

extension FAQResponseModelMapper on FAQResponseModel {
  FAQResponse toEntity() {
    return FAQResponse(
      success: success ?? false,
      message: message ?? '-',
      data: data?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension FAQModelMapper on FAQDataModel {
  FAQDataEntity toEntity() {
    return FAQDataEntity(
      id: id ?? '-',
      slug: slug ?? '-',
      title: title ?? '-',
      description: description ?? '-',
      createdAt: createdAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: updatedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      deletedAt: deletedAt ?? '-',
    );
  }
}
