import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/common_api/domain/entities/floor_and_unit_response_entity.dart';

part 'floor_and_unit_response.g.dart';

FloorAndUnitResponseModel FloorAndUnitResponseModelFromJson(String str) =>
    FloorAndUnitResponseModel.fromJson(json.decode(str));

@JsonSerializable()
class FloorAndUnitResponseModel {
  @JsonKey(name: "designation")
  final List<Designation>? designation;
  @JsonKey(name: "floors")
  final List<Floor>? floors;
  @JsonKey(name: "sub_department_list")
  final List<SubDepartmentList>? subDepartmentList;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "status")
  final String? status;

  FloorAndUnitResponseModel({
    this.designation,
    this.floors,
    this.subDepartmentList,
    this.message,
    this.status,
  });

  factory FloorAndUnitResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FloorAndUnitResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FloorAndUnitResponseModelToJson(this);

  /// ✅ Convert to Entity
  FloorAndUnitResponseEntity toEntity() => FloorAndUnitResponseEntity(
    designation: designation?.map((e) => e.toEntity()).toList(),
    floors: floors?.map((e) => e.toEntity()).toList(),
    subDepartmentList: subDepartmentList?.map((e) => e.toEntity()).toList(),
    message: message,
    status: status,
  );
}

@JsonSerializable()
class Designation {
  @JsonKey(name: "designation_id")
  final String? designationId;
  @JsonKey(name: "designation_name")
  final String? designationName;

  Designation({
    this.designationId,
    this.designationName,
  });

  factory Designation.fromJson(Map<String, dynamic> json) =>
      _$DesignationFromJson(json);

  Map<String, dynamic> toJson() => _$DesignationToJson(this);

  /// ✅ Convert to Entity
  DesignationEntity toEntity() => DesignationEntity(
    designationId: designationId,
    designationName: designationName,
  );
}

@JsonSerializable()
class Floor {
  @JsonKey(name: "floor_id")
  final String? floorId;
  @JsonKey(name: "society_id")
  final String? societyId;
  @JsonKey(name: "block_id")
  final String? blockId;
  @JsonKey(name: "floor_name")
  final String? floorName;
  @JsonKey(name: "floor_status")
  final String? floorStatus;

  Floor({
    this.floorId,
    this.societyId,
    this.blockId,
    this.floorName,
    this.floorStatus,
  });

  factory Floor.fromJson(Map<String, dynamic> json) =>
      _$FloorFromJson(json);

  Map<String, dynamic> toJson() => _$FloorToJson(this);

  /// ✅ Convert to Entity
  FloorEntity toEntity() => FloorEntity(
    floorId: floorId,
    societyId: societyId,
    blockId: blockId,
    floorName: floorName,
    floorStatus: floorStatus,
  );
}

@JsonSerializable()
class SubDepartmentList {
  @JsonKey(name: "sub_department_id")
  final String? subDepartmentId;
  @JsonKey(name: "society_id")
  final String? societyId;
  @JsonKey(name: "block_id")
  final String? blockId;
  @JsonKey(name: "floor_id")
  final String? floorId;
  @JsonKey(name: "sub_department_name")
  final String? subDepartmentName;

  SubDepartmentList({
    this.subDepartmentId,
    this.societyId,
    this.blockId,
    this.floorId,
    this.subDepartmentName,
  });

  factory SubDepartmentList.fromJson(Map<String, dynamic> json) =>
      _$SubDepartmentListFromJson(json);

  Map<String, dynamic> toJson() => _$SubDepartmentListToJson(this);

  /// ✅ Convert to Entity
  SubDepartmentEntity toEntity() => SubDepartmentEntity(
    subDepartmentId: subDepartmentId,
    societyId: societyId,
    blockId: blockId,
    floorId: floorId,
    subDepartmentName: subDepartmentName,
  );
}
