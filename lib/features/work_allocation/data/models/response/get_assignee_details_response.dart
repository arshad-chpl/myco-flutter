import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/work_allocation/domain/entities/get_assignee_entity.dart';

part 'get_assignee_details_response.g.dart';

GetAssigneeResponseModel getAssigneeResponseModelFromJson(String str) =>
    GetAssigneeResponseModel.fromJson(json.decode(str));

@JsonSerializable()
class GetAssigneeResponseModel {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'work_allocation_id')
  final String? workAllocationId;
  @JsonKey(name: 'assigned_engineer_id')
  final String? assignedEngineerId;
  @JsonKey(name: 'hod_id')
  final String? hodId;
  @JsonKey(name: 'user_full_name')
  final String? userFullName;
  @JsonKey(name: 'user_designation')
  final String? userDesignation;
  @JsonKey(name: 'short_name')
  final String? shortName;
  @JsonKey(name: 'user_profile_pic')
  final String? userProfilePic;
  @JsonKey(name: 'floor_name')
  final String? floorName;
  @JsonKey(name: 'block_name')
  final String? blockName;
  @JsonKey(name: 'work_category_id')
  final String? workCategoryId;
  @JsonKey(name: 'work_category_name')
  final String? workCategoryName;
  @JsonKey(name: 'project_name')
  final String? projectName;
  @JsonKey(name: 'site')
  final String? site;
  @JsonKey(name: 'location')
  final String? location;
  @JsonKey(name: 'hod_remark')
  final String? hodRemark;
  @JsonKey(name: 'engineer_remark')
  final String? engineerRemark;
  @JsonKey(name: 'start_date')
  final String? startDate;
  final String? endDate;
  @JsonKey(name: 'start_date_view')
  final String? startDateView;
  @JsonKey(name: 'end_date_view')
  final String? endDateView;
  @JsonKey(name: 'engineer_status')
  final String? engineerStatus;
  @JsonKey(name: 'hod_remarka')
  final String? hodRemarka;
  @JsonKey(name: 'completion_date_by_engg')
  final String? completionDateByEngg;
  @JsonKey(name: 'completion_date_by_engg_view')
  final String? completionDateByEnggView;
  @JsonKey(name: 'engineer_comnpletion_remark')
  final String? engineerCompletionRemark;
  @JsonKey(name: 'authorized_date_by_hod')
  final String? authorizedDateByHod;
  @JsonKey(name: 'authorized_date_by_hod_view')
  final String? authorizedDateByHodView;
  @JsonKey(name: 'completion_remark')
  final String? completionRemark;
  @JsonKey(name: 'hod_completion_remark')
  final String? hodCompletionRemark;
  @JsonKey(name: 'is_reassigned')
  final String? isReassigned;
  @JsonKey(name: 'created_date')
  final String? createdDate;
  @JsonKey(name: 'updated_date')
  final String? updatedDate;
  @JsonKey(name: 'updated_by_name')
  final String? updatedByName;

  GetAssigneeResponseModel({
    this.message,
    this.status,
    this.workAllocationId,
    this.assignedEngineerId,
    this.hodId,
    this.userFullName,
    this.userDesignation,
    this.shortName,
    this.userProfilePic,
    this.floorName,
    this.blockName,
    this.workCategoryId,
    this.workCategoryName,
    this.projectName,
    this.site,
    this.location,
    this.hodRemark,
    this.engineerRemark,
    this.startDate,
    this.endDate,
    this.startDateView,
    this.endDateView,
    this.engineerStatus,
    this.hodRemarka,
    this.completionDateByEngg,
    this.completionDateByEnggView,
    this.engineerCompletionRemark,
    this.authorizedDateByHod,
    this.authorizedDateByHodView,
    this.completionRemark,
    this.hodCompletionRemark,
    this.isReassigned,
    this.createdDate,
    this.updatedDate,
    this.updatedByName,
  });

  factory GetAssigneeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetAssigneeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAssigneeResponseModelToJson(this);

  /// Converts this data model to a domain entity.
  GetAssigneeResponseEntity toEntity() => GetAssigneeResponseEntity(
    message: message,
    status: status,
    workAllocationId: workAllocationId,
    assignedEngineerId: assignedEngineerId,
    hodId: hodId,
    userFullName: userFullName,
    userDesignation: userDesignation,
    shortName: shortName,
    userProfilePic: userProfilePic,
    floorName: floorName,
    blockName: blockName,
    workCategoryId: workCategoryId,
    workCategoryName: workCategoryName,
    projectName: projectName,
    site: site,
    location: location,
    hodRemark: hodRemark,
    engineerRemark: engineerRemark,
    startDate: startDate,
    endDate: endDate,
    startDateView: startDateView,
    endDateView: endDateView,
    engineerStatus: engineerStatus,
    hodRemarka: hodRemarka,
    completionDateByEngg: completionDateByEngg,
    completionDateByEnggView: completionDateByEnggView,
    engineerCompletionRemark: engineerCompletionRemark,
    authorizedDateByHod: authorizedDateByHod,
    authorizedDateByHodView: authorizedDateByHodView,
    completionRemark: completionRemark,
    hodCompletionRemark: hodCompletionRemark,
    isReassigned: isReassigned,
    createdDate: createdDate,
    updatedDate: updatedDate,
    updatedByName: updatedByName,
  );
}
