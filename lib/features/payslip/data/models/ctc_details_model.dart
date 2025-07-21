// To parse this JSON data, do
//
//     final ctcDetailsModel = ctcDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/payslip/domain/entities/ctc_details_entity.dart';

part 'ctc_details_model.g.dart';

CtcDetailsModel ctcDetailsModelFromJson(String str) =>
    CtcDetailsModel.fromJson(json.decode(str));

String ctcDetailsModelToJson(CtcDetailsModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class CtcDetailsModel {
  @JsonKey(name: 'last_month_salary_generated')
  bool? lastMonthSalaryGenerated;
  @JsonKey(name: 'salary_type')
  String? salaryType;
  @JsonKey(name: 'earning_head_name')
  List<EarningHeadName>? earningHeadName;
  @JsonKey(name: 'ctc_head_name')
  List<CtcHeadName>? ctcHeadName;
  @JsonKey(name: 'deduction_head_name')
  List<DeductionHeadName>? deductionHeadName;
  @JsonKey(name: 'ctc_per_month')
  String? ctcPerMonth;
  @JsonKey(name: 'ctc_per_annum')
  String? ctcPerAnnum;
  @JsonKey(name: 'salary_per_month')
  String? salaryPerMonth;
  @JsonKey(name: 'salary_per_annum')
  String? salaryPerAnnum;
  @JsonKey(name: 'deduct_per_month')
  String? deductPerMonth;
  @JsonKey(name: 'deduct_per_annum')
  String? deductPerAnnum;
  @JsonKey(name: 'net_salary_per_month_in_hand')
  String? netSalaryPerMonthInHand;
  @JsonKey(name: 'net_salary_per_month_in_hand_advance_salary')
  String? netSalaryPerMonthInHandAdvanceSalary;
  @JsonKey(name: 'net_salary_per_month_in_hand_word')
  String? netSalaryPerMonthInHandWord;
  @JsonKey(name: 'net_salary_per_annum_in_hand')
  String? netSalaryPerAnnumInHand;
  @JsonKey(name: 'net_salary_per_annum_in_hand_word')
  String? netSalaryPerAnnumInHandWord;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'status')
  String? status;

  CtcDetailsModel({
    this.lastMonthSalaryGenerated,
    this.salaryType,
    this.earningHeadName,
    this.ctcHeadName,
    this.deductionHeadName,
    this.ctcPerMonth,
    this.ctcPerAnnum,
    this.salaryPerMonth,
    this.salaryPerAnnum,
    this.deductPerMonth,
    this.deductPerAnnum,
    this.netSalaryPerMonthInHand,
    this.netSalaryPerMonthInHandAdvanceSalary,
    this.netSalaryPerMonthInHandWord,
    this.netSalaryPerAnnumInHand,
    this.netSalaryPerAnnumInHandWord,
    this.message,
    this.status,
  });

  factory CtcDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CtcDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CtcDetailsModelToJson(this);

  CtcDetailsEntity toEntity() => CtcDetailsEntity(
    lastMonthSalaryGenerated: lastMonthSalaryGenerated,
    salaryType: salaryType,
    earningHeads: earningHeadName?.map((e) => e.toEntity()).toList(),
    ctcHeads: ctcHeadName?.map((e) => e.toEntity()).toList(),
    deductionHeads: deductionHeadName?.map((e) => e.toEntity()).toList(),
    ctcPerMonth: ctcPerMonth,
    ctcPerAnnum: ctcPerAnnum,
    salaryPerMonth: salaryPerMonth,
    salaryPerAnnum: salaryPerAnnum,
    deductPerMonth: deductPerMonth,
    deductPerAnnum: deductPerAnnum,
    netSalaryPerMonthInHand: netSalaryPerMonthInHand,
    netSalaryPerMonthInHandAdvanceSalary: netSalaryPerMonthInHandAdvanceSalary,
    netSalaryPerMonthInHandWord: netSalaryPerMonthInHandWord,
    netSalaryPerAnnumInHand: netSalaryPerAnnumInHand,
    netSalaryPerAnnumInHandWord: netSalaryPerAnnumInHandWord,
    message: message,
    status: status,
  );
}

@JsonSerializable()
class CtcHeadName {
  @JsonKey(name: 'head_name')
  String? headName;
  @JsonKey(name: 'ctc_per_month')
  String? ctcPerMonth;
  @JsonKey(name: 'ctc_per_annum')
  String? ctcPerAnnum;

  CtcHeadName({this.headName, this.ctcPerMonth, this.ctcPerAnnum});

  factory CtcHeadName.fromJson(Map<String, dynamic> json) =>
      _$CtcHeadNameFromJson(json);

  Map<String, dynamic> toJson() => _$CtcHeadNameToJson(this);

  CtcHeadEntity toEntity() => CtcHeadEntity(
    headName: headName,
    ctcPerMonth: ctcPerMonth,
    ctcPerAnnum: ctcPerAnnum,
  );
}

@JsonSerializable()
class DeductionHeadName {
  @JsonKey(name: 'head_name')
  String? headName;
  @JsonKey(name: 'per_month')
  String? perMonth;
  @JsonKey(name: 'per_annum')
  String? perAnnum;

  DeductionHeadName({this.headName, this.perMonth, this.perAnnum});

  factory DeductionHeadName.fromJson(Map<String, dynamic> json) =>
      _$DeductionHeadNameFromJson(json);

  Map<String, dynamic> toJson() => _$DeductionHeadNameToJson(this);

  DeductionHeadEntity toEntity() => DeductionHeadEntity(
    headName: headName,
    perAnnum: perAnnum,
    perMonth: perMonth,
  );
}

@JsonSerializable()
class EarningHeadName {
  @JsonKey(name: 'head_name')
  String? headName;
  @JsonKey(name: 'salary_per_month')
  String? salaryPerMonth;
  @JsonKey(name: 'salary_per_annum')
  String? salaryPerAnnum;

  EarningHeadName({this.headName, this.salaryPerMonth, this.salaryPerAnnum});

  factory EarningHeadName.fromJson(Map<String, dynamic> json) =>
      _$EarningHeadNameFromJson(json);

  Map<String, dynamic> toJson() => _$EarningHeadNameToJson(this);

  EarningHeadEntity toEntity() => EarningHeadEntity(
    headName: headName,
    salaryPerMonth: salaryPerMonth,
    salaryPerAnnum: salaryPerAnnum,
  );
}
