import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/work_allocation/domain/entities/work_allocation_entity.dart';

part 'work_allocation_response.g.dart';

WorkAllocationResponseModel workAllocationResponseModelFromJson(String str) =>
    WorkAllocationResponseModel.fromJson(json.decode(str));

@JsonSerializable()
class WorkAllocationResponseModel {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'work_allocation')
  final List<WorkAllocationListModel>? workAllocation;

  WorkAllocationResponseModel({this.message, this.status, this.workAllocation});

  factory WorkAllocationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WorkAllocationResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkAllocationResponseModelToJson(this);

  WorkAllocationResponseEntity toEntity() => WorkAllocationResponseEntity(
    message: message,
    status: status,
    workAllocation: workAllocation?.map((model) => model.toEntity()).toList(),
  );
}

@JsonSerializable()
class WorkAllocationListModel {
  @JsonKey(name: 'work_allocation_id')
  final String? workAllocationId;
  @JsonKey(name: 'society_id')
  final String? companyId;
  @JsonKey(name: 'hod_id')
  final String? hodId;
  @JsonKey(name: 'assigned_engineer_id')
  final String? assignedEngineerId;
  @JsonKey(name: 'user_full_name')
  final String? userFullName;
  @JsonKey(name: 'work_category_name')
  final String? workCategoryName;
  @JsonKey(name: 'short_name')
  final String? shortName;
  @JsonKey(name: 'user_profile_pic')
  final String? userProfilePic;
  @JsonKey(name: 'user_designation')
  final String? userDesignation;
  @JsonKey(name: 'block_name')
  final String? blockName;
  @JsonKey(name: 'floor_name')
  final String? floorName;
  @JsonKey(name: 'work_category_id')
  final String? workCategoryId;
  @JsonKey(name: 'project_name')
  final String? projectName;
  @JsonKey(name: 'site')
  final String? site;
  @JsonKey(name: 'location')
  final String? location;
  @JsonKey(name: 'start_date')
  final String? startDate;
  @JsonKey(name: 'end_date')
  final String? endDate;
  @JsonKey(name: 'start_date_view')
  final String? startDateView;
  @JsonKey(name: 'end_date_view')
  final String? endDateView;
  @JsonKey(name: 'engineer_status')
  final String? engineerStatus;
  @JsonKey(name: 'completion_date_by_engg')
  final String? completionDateByEngg;
  @JsonKey(name: 'authorized_date_by_hod')
  final String? authorizedDateByHod;
  @JsonKey(name: 'created_date')
  final String? createdDate;
  @JsonKey(name: 'is_reassigned')
  final String? isReassigned;

  WorkAllocationListModel({
    this.workAllocationId,
    this.companyId,
    this.hodId,
    this.assignedEngineerId,
    this.userFullName,
    this.workCategoryName,
    this.shortName,
    this.userProfilePic,
    this.userDesignation,
    this.blockName,
    this.floorName,
    this.workCategoryId,
    this.projectName,
    this.site,
    this.location,
    this.startDate,
    this.endDate,
    this.startDateView,
    this.endDateView,
    this.engineerStatus,
    this.completionDateByEngg,
    this.authorizedDateByHod,
    this.createdDate,
    this.isReassigned,
  });

  factory WorkAllocationListModel.fromJson(Map<String, dynamic> json) =>
      _$WorkAllocationListModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkAllocationListModelToJson(this);

  WorkAllocationListEntity toEntity() => WorkAllocationListEntity(
    workAllocationId: workAllocationId,
    companyId: companyId,
    hodId: hodId,
    assignedEngineerId: assignedEngineerId,
    userFullName: userFullName,
    workCategoryName: workCategoryName,
    shortName: shortName,
    userProfilePic: userProfilePic,
    userDesignation: userDesignation,
    blockName: blockName,
    floorName: floorName,
    workCategoryId: workCategoryId,
    projectName: projectName,
    site: site,
    location: location,
    startDate: startDate,
    endDate: endDate,
    startDateView: startDateView,
    endDateView: endDateView,
    engineerStatus: engineerStatus,
    completionDateByEngg: completionDateByEngg,
    authorizedDateByHod: authorizedDateByHod,
    createdDate: createdDate,
    isReassigned: isReassigned,
  );
}
