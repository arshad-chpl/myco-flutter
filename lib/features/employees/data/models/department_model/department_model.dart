import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/employees/domain/entites/department.dart';

part 'department_model.g.dart';

DepartmentModel departmentModelFromJson(String str) =>
    DepartmentModel.fromJson(json.decode(str));

String departmentModelToJson(DepartmentModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class DepartmentModel extends Equatable {
  @JsonKey(name: "floor_id")
  final String? floorId;

  @JsonKey(name: "society_id")
  final String? societyId;

  @JsonKey(name: "block_id")
  final String? blockId;

  @JsonKey(name: "block_name")
  final String? blockName;

  @JsonKey(name: "department_name")
  final String? departmentName;

  @JsonKey(name: "is_my_department")
  final bool? isMyDepartment;

  const DepartmentModel({
    this.floorId,
    this.societyId,
    this.blockId,
    this.blockName,
    this.departmentName,
    this.isMyDepartment,
  });

  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      _$DepartmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentModelToJson(this);

  Department toEntity() => Department(
    floorId: floorId,
    societyId: societyId,
    blockId: blockId,
    blockName: blockName,
    departmentName: departmentName,
    isMyDepartment: isMyDepartment,
  );

  @override
  List<Object?> get props => [
    floorId,
    societyId,
    blockId,
    blockName,
    departmentName,
    isMyDepartment,
  ];
}
