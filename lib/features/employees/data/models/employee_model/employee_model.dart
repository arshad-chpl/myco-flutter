// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:myco_flutter/features/employees/domain/entites/employee.dart';

part 'employee_model.g.dart';

EmployeeModel employeeModelFromJson(String str) =>
    EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

@JsonSerializable()
class EmployeeModel {
  @JsonKey(name: "user_id")
  String? userId;
  @JsonKey(name: "unit_id")
  String? unitId;
  @JsonKey(name: "block_id")
  String? blockId;
  @JsonKey(name: "floor_id")
  String? floorId;
  @JsonKey(name: "user_first_name")
  String? userFirstName;
  @JsonKey(name: "user_last_name")
  String? userLastName;
  @JsonKey(name: "user_mobile")
  String? userMobile;
  @JsonKey(name: "user_full_name")
  String? userFullName;
  @JsonKey(name: "short_name")
  String? shortName;
  @JsonKey(name: "society_id")
  String? societyId;
  @JsonKey(name: "designation")
  String? designation;
  @JsonKey(name: "company_leave_date")
  String? companyLeaveDate;
  @JsonKey(name: "company_leave_date_view")
  String? companyLeaveDateView;
  @JsonKey(name: "is_future_date")
  bool? isFutureDate;
  @JsonKey(name: "user_active")
  bool? userActive;
  @JsonKey(name: "user_profile_pic")
  String? userProfilePic;

  EmployeeModel({
    this.userId,
    this.unitId,
    this.blockId,
    this.floorId,
    this.userFirstName,
    this.userLastName,
    this.userMobile,
    this.userFullName,
    this.shortName,
    this.societyId,
    this.designation,
    this.companyLeaveDate,
    this.companyLeaveDateView,
    this.isFutureDate,
    this.userActive,
    this.userProfilePic,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeModelToJson(this);

  Employee toEntity() => Employee(
    userId: userId,
    unitId: unitId,
    blockId: blockId,
    floorId: floorId,
    userFirstName: userFirstName,
    userLastName: userLastName,
    userMobile: userMobile,
    userFullName: userFullName,
    shortName: shortName,
    societyId: societyId,
    designation: designation,
    companyLeaveDate: companyLeaveDate,
    companyLeaveDateView: companyLeaveDateView,
    isFutureDate: isFutureDate,
    userActive: userActive,
    userProfilePic: userProfilePic,
  );
}
