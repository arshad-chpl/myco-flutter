import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/work_allocation/domain/entities/get_work_category_entity.dart';

part 'get_work_category_response.g.dart';

GetWorkCategoryResponseModel getWorkCategoryResponseModelFromJson(String str) =>
    GetWorkCategoryResponseModel.fromJson(json.decode(str));

@JsonSerializable()
class GetWorkCategoryResponseModel {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'work_category')
  final List<WorkCategoryListModel>? workCategory;

  GetWorkCategoryResponseModel({this.message, this.status, this.workCategory});

  factory GetWorkCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetWorkCategoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetWorkCategoryResponseModelToJson(this);

  // Ensure this returns the correct entity type from your get_work_category_entity.dart
  GetWorkCategoryResponseEntity toEntity() => GetWorkCategoryResponseEntity(
    message: message,
    status: status,
    workCategory: workCategory?.map((model) => model.toEntity()).toList(),
  );
}

@JsonSerializable()
class WorkCategoryListModel {
  @JsonKey(name: 'work_category_id')
  final String? workCategoryId;
  @JsonKey(name: 'work_category_name')
  final String? workCategoryName;

  WorkCategoryListModel({this.workCategoryId, this.workCategoryName});

  factory WorkCategoryListModel.fromJson(Map<String, dynamic> json) =>
      _$WorkCategoryListModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkCategoryListModelToJson(this);

  WorkCategoryListEntity toEntity() => WorkCategoryListEntity(
      workCategoryId: workCategoryId,
      workCategoryName: workCategoryName
  );
}