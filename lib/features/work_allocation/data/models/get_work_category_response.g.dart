// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_work_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWorkCategoryResponseModel _$GetWorkCategoryResponseModelFromJson(
  Map<String, dynamic> json,
) => GetWorkCategoryResponseModel(
  message: json['message'] as String?,
  status: json['status'] as String?,
  workCategory:
      (json['work_category'] as List<dynamic>?)
          ?.map(
            (e) => WorkCategoryListModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$GetWorkCategoryResponseModelToJson(
  GetWorkCategoryResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'status': instance.status,
  'work_category': instance.workCategory,
};

WorkCategoryListModel _$WorkCategoryListModelFromJson(
  Map<String, dynamic> json,
) => WorkCategoryListModel(
  workCategoryId: json['work_category_id'] as String?,
  workCategoryName: json['work_category_name'] as String?,
);

Map<String, dynamic> _$WorkCategoryListModelToJson(
  WorkCategoryListModel instance,
) => <String, dynamic>{
  'work_category_id': instance.workCategoryId,
  'work_category_name': instance.workCategoryName,
};
