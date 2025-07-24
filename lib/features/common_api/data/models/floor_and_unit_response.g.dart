// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_and_unit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FloorAndUnitResponseModel _$FloorAndUnitResponseModelFromJson(
        Map<String, dynamic> json) =>
    FloorAndUnitResponseModel(
      designation: (json['designation'] as List<dynamic>?)
          ?.map((e) => Designation.fromJson(e as Map<String, dynamic>))
          .toList(),
      floors: (json['floors'] as List<dynamic>?)
          ?.map((e) => Floor.fromJson(e as Map<String, dynamic>))
          .toList(),
      subDepartmentList: (json['sub_department_list'] as List<dynamic>?)
          ?.map((e) => SubDepartmentList.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$FloorAndUnitResponseModelToJson(
        FloorAndUnitResponseModel instance) =>
    <String, dynamic>{
      'designation': instance.designation,
      'floors': instance.floors,
      'sub_department_list': instance.subDepartmentList,
      'message': instance.message,
      'status': instance.status,
    };

Designation _$DesignationFromJson(Map<String, dynamic> json) => Designation(
      designationId: json['designation_id'] as String?,
      designationName: json['designation_name'] as String?,
    );

Map<String, dynamic> _$DesignationToJson(Designation instance) =>
    <String, dynamic>{
      'designation_id': instance.designationId,
      'designation_name': instance.designationName,
    };

Floor _$FloorFromJson(Map<String, dynamic> json) => Floor(
      floorId: json['floor_id'] as String?,
      societyId: json['society_id'] as String?,
      blockId: json['block_id'] as String?,
      floorName: json['floor_name'] as String?,
      floorStatus: json['floor_status'] as String?,
    );

Map<String, dynamic> _$FloorToJson(Floor instance) => <String, dynamic>{
      'floor_id': instance.floorId,
      'society_id': instance.societyId,
      'block_id': instance.blockId,
      'floor_name': instance.floorName,
      'floor_status': instance.floorStatus,
    };

SubDepartmentList _$SubDepartmentListFromJson(Map<String, dynamic> json) =>
    SubDepartmentList(
      subDepartmentId: json['sub_department_id'] as String?,
      societyId: json['society_id'] as String?,
      blockId: json['block_id'] as String?,
      floorId: json['floor_id'] as String?,
      subDepartmentName: json['sub_department_name'] as String?,
    );

Map<String, dynamic> _$SubDepartmentListToJson(SubDepartmentList instance) =>
    <String, dynamic>{
      'sub_department_id': instance.subDepartmentId,
      'society_id': instance.societyId,
      'block_id': instance.blockId,
      'floor_id': instance.floorId,
      'sub_department_name': instance.subDepartmentName,
    };
