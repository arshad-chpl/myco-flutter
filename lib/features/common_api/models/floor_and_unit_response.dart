// To parse this JSON data, do
//
//     final floorAndUnitResponse = floorAndUnitResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'floor_and_unit_response.g.dart';

FloorAndUnitResponse floorAndUnitResponseFromJson(String str) => FloorAndUnitResponse.fromJson(json.decode(str));

String floorAndUnitResponseToJson(FloorAndUnitResponse data) => json.encode(data.toJson());

@JsonSerializable()
class FloorAndUnitResponse {
  @JsonKey(name: "designation")
  List<Designation>? designation;
  @JsonKey(name: "floors")
  List<Floor>? floors;
  @JsonKey(name: "sub_department_list")
  List<SubDepartmentList>? subDepartmentList;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "status")
  String? status;

  FloorAndUnitResponse({
    this.designation,
    this.floors,
    this.subDepartmentList,
    this.message,
    this.status,
  });

  factory FloorAndUnitResponse.fromJson(Map<String, dynamic> json) => _$FloorAndUnitResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FloorAndUnitResponseToJson(this);
}

@JsonSerializable()
class Designation {
  @JsonKey(name: "designation_id")
  String? designationId;
  @JsonKey(name: "designation_name")
  String? designationName;

  Designation({
    this.designationId,
    this.designationName,
  });

  factory Designation.fromJson(Map<String, dynamic> json) => _$DesignationFromJson(json);

  Map<String, dynamic> toJson() => _$DesignationToJson(this);
}

@JsonSerializable()
class Floor {
  @JsonKey(name: "floor_id")
  String? floorId;
  @JsonKey(name: "society_id")
  String? societyId;
  @JsonKey(name: "block_id")
  String? blockId;
  @JsonKey(name: "floor_name")
  String? floorName;
  @JsonKey(name: "floor_status")
  String? floorStatus;

  Floor({
    this.floorId,
    this.societyId,
    this.blockId,
    this.floorName,
    this.floorStatus,
  });

  factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);

  Map<String, dynamic> toJson() => _$FloorToJson(this);
}

@JsonSerializable()
class SubDepartmentList {
  @JsonKey(name: "sub_department_id")
  String? subDepartmentId;
  @JsonKey(name: "society_id")
  String? societyId;
  @JsonKey(name: "block_id")
  String? blockId;
  @JsonKey(name: "floor_id")
  String? floorId;
  @JsonKey(name: "sub_department_name")
  String? subDepartmentName;

  SubDepartmentList({
    this.subDepartmentId,
    this.societyId,
    this.blockId,
    this.floorId,
    this.subDepartmentName,
  });

  factory SubDepartmentList.fromJson(Map<String, dynamic> json) => _$SubDepartmentListFromJson(json);

  Map<String, dynamic> toJson() => _$SubDepartmentListToJson(this);
}
