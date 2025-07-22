// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_assignee_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAssigneeResponseModel _$GetAssigneeResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAssigneeResponseModel(
      message: json['message'] as String?,
      status: json['status'] as String?,
      workAllocationId: json['work_allocation_id'] as String?,
      assignedEngineerId: json['assigned_engineer_id'] as String?,
      hodId: json['hod_id'] as String?,
      userFullName: json['user_full_name'] as String?,
      userDesignation: json['user_designation'] as String?,
      shortName: json['short_name'] as String?,
      userProfilePic: json['user_profile_pic'] as String?,
      floorName: json['floor_name'] as String?,
      blockName: json['block_name'] as String?,
      workCategoryId: json['work_category_id'] as String?,
      workCategoryName: json['work_category_name'] as String?,
      projectName: json['project_name'] as String?,
      site: json['site'] as String?,
      location: json['location'] as String?,
      hodRemark: json['hod_remark'] as String?,
      engineerRemark: json['engineer_remark'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['endDate'] as String?,
      startDateView: json['start_date_view'] as String?,
      endDateView: json['end_date_view'] as String?,
      engineerStatus: json['engineer_status'] as String?,
      hodRemarka: json['hod_remarka'] as String?,
      completionDateByEngg: json['completion_date_by_engg'] as String?,
      completionDateByEnggView: json['completion_date_by_engg_view'] as String?,
      engineerCompletionRemark: json['engineer_comnpletion_remark'] as String?,
      authorizedDateByHod: json['authorized_date_by_hod'] as String?,
      authorizedDateByHodView: json['authorized_date_by_hod_view'] as String?,
      completionRemark: json['completion_remark'] as String?,
      hodCompletionRemark: json['hod_completion_remark'] as String?,
      isReassigned: json['is_reassigned'] as String?,
      createdDate: json['created_date'] as String?,
      updatedDate: json['updated_date'] as String?,
      updatedByName: json['updated_by_name'] as String?,
    );

Map<String, dynamic> _$GetAssigneeResponseModelToJson(
        GetAssigneeResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'work_allocation_id': instance.workAllocationId,
      'assigned_engineer_id': instance.assignedEngineerId,
      'hod_id': instance.hodId,
      'user_full_name': instance.userFullName,
      'user_designation': instance.userDesignation,
      'short_name': instance.shortName,
      'user_profile_pic': instance.userProfilePic,
      'floor_name': instance.floorName,
      'block_name': instance.blockName,
      'work_category_id': instance.workCategoryId,
      'work_category_name': instance.workCategoryName,
      'project_name': instance.projectName,
      'site': instance.site,
      'location': instance.location,
      'hod_remark': instance.hodRemark,
      'engineer_remark': instance.engineerRemark,
      'start_date': instance.startDate,
      'endDate': instance.endDate,
      'start_date_view': instance.startDateView,
      'end_date_view': instance.endDateView,
      'engineer_status': instance.engineerStatus,
      'hod_remarka': instance.hodRemarka,
      'completion_date_by_engg': instance.completionDateByEngg,
      'completion_date_by_engg_view': instance.completionDateByEnggView,
      'engineer_comnpletion_remark': instance.engineerCompletionRemark,
      'authorized_date_by_hod': instance.authorizedDateByHod,
      'authorized_date_by_hod_view': instance.authorizedDateByHodView,
      'completion_remark': instance.completionRemark,
      'hod_completion_remark': instance.hodCompletionRemark,
      'is_reassigned': instance.isReassigned,
      'created_date': instance.createdDate,
      'updated_date': instance.updatedDate,
      'updated_by_name': instance.updatedByName,
    };
