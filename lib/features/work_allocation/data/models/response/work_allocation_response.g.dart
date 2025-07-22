// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_allocation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkAllocationResponseModel _$WorkAllocationResponseModelFromJson(
        Map<String, dynamic> json) =>
    WorkAllocationResponseModel(
      message: json['message'] as String?,
      status: json['status'] as String?,
      workAllocation: (json['work_allocation'] as List<dynamic>?)
          ?.map((e) =>
              WorkAllocationListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkAllocationResponseModelToJson(
        WorkAllocationResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'work_allocation': instance.workAllocation,
    };

WorkAllocationListModel _$WorkAllocationListModelFromJson(
        Map<String, dynamic> json) =>
    WorkAllocationListModel(
      workAllocationId: json['work_allocation_id'] as String?,
      companyId: json['society_id'] as String?,
      hodId: json['hod_id'] as String?,
      assignedEngineerId: json['assigned_engineer_id'] as String?,
      userFullName: json['user_full_name'] as String?,
      workCategoryName: json['work_category_name'] as String?,
      shortName: json['short_name'] as String?,
      userProfilePic: json['user_profile_pic'] as String?,
      userDesignation: json['user_designation'] as String?,
      blockName: json['block_name'] as String?,
      floorName: json['floor_name'] as String?,
      workCategoryId: json['work_category_id'] as String?,
      projectName: json['project_name'] as String?,
      site: json['site'] as String?,
      location: json['location'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      startDateView: json['start_date_view'] as String?,
      endDateView: json['end_date_view'] as String?,
      engineerStatus: json['engineer_status'] as String?,
      completionDateByEngg: json['completion_date_by_engg'] as String?,
      authorizedDateByHod: json['authorized_date_by_hod'] as String?,
      createdDate: json['created_date'] as String?,
      isReassigned: json['is_reassigned'] as String?,
    );

Map<String, dynamic> _$WorkAllocationListModelToJson(
        WorkAllocationListModel instance) =>
    <String, dynamic>{
      'work_allocation_id': instance.workAllocationId,
      'society_id': instance.companyId,
      'hod_id': instance.hodId,
      'assigned_engineer_id': instance.assignedEngineerId,
      'user_full_name': instance.userFullName,
      'work_category_name': instance.workCategoryName,
      'short_name': instance.shortName,
      'user_profile_pic': instance.userProfilePic,
      'user_designation': instance.userDesignation,
      'block_name': instance.blockName,
      'floor_name': instance.floorName,
      'work_category_id': instance.workCategoryId,
      'project_name': instance.projectName,
      'site': instance.site,
      'location': instance.location,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'start_date_view': instance.startDateView,
      'end_date_view': instance.endDateView,
      'engineer_status': instance.engineerStatus,
      'completion_date_by_engg': instance.completionDateByEngg,
      'authorized_date_by_hod': instance.authorizedDateByHod,
      'created_date': instance.createdDate,
      'is_reassigned': instance.isReassigned,
    };
