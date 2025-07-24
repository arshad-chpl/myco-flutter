// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartmentModel _$DepartmentModelFromJson(Map<String, dynamic> json) =>
    DepartmentModel(
      floorId: json['floor_id'] as String?,
      societyId: json['society_id'] as String?,
      blockId: json['block_id'] as String?,
      blockName: json['block_name'] as String?,
      departmentName: json['department_name'] as String?,
      isMyDepartment: json['is_my_department'] as bool?,
    );

Map<String, dynamic> _$DepartmentModelToJson(DepartmentModel instance) =>
    <String, dynamic>{
      'floor_id': instance.floorId,
      'society_id': instance.societyId,
      'block_id': instance.blockId,
      'block_name': instance.blockName,
      'department_name': instance.departmentName,
      'is_my_department': instance.isMyDepartment,
    };
