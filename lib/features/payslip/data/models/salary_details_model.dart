// To parse this JSON data, do
//
//     final salaryDetailsModel = salaryDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/payslip/domain/entities/salary_details_entity.dart';

part 'salary_details_model.g.dart';

SalaryDetailsModel salaryDetailsModelFromJson(String str) =>
    SalaryDetailsModel.fromJson(json.decode(str));

String salaryDetailsModelToJson(SalaryDetailsModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class SalaryDetailsModel {
  @JsonKey(name: 'salary_slip_id')
  String? salarySlipId;
  @JsonKey(name: 'total_month_days')
  String? totalMonthDays;
  @JsonKey(name: 'leave_days')
  String? leaveDays;
  @JsonKey(name: 'extra_days')
  String? extraDays;
  @JsonKey(name: 'paid_week_off')
  String? paidWeekOff;
  @JsonKey(name: 'paid_holidays')
  String? paidHolidays;
  @JsonKey(name: 'total_working_days')
  String? totalWorkingDays;
  @JsonKey(name: 'salary_type_current')
  String? salaryTypeCurrent;
  @JsonKey(name: 'total_ctc_cost')
  String? totalCtcCost;
  @JsonKey(name: 'total_special_allowance')
  String? totalSpecialAllowance;
  @JsonKey(name: 'day_salary')
  String? daySalary;
  @JsonKey(name: 'salary_month_year')
  String? salaryMonthYear;
  @JsonKey(name: 'salary_mode')
  String? salaryMode;
  @JsonKey(name: 'total_contri')
  String? totalContri;
  @JsonKey(name: 'contri_data')
  List<Datum>? contriData;
  @JsonKey(name: 'earning_data')
  List<Datum>? earningData;
  @JsonKey(name: 'special_earning_data')
  dynamic specialEarningData;
  @JsonKey(name: 'expense_amount')
  String? expenseAmount;
  @JsonKey(name: 'has_reimbursement')
  bool? hasReimbursement;
  @JsonKey(name: 'other_net_earning')
  List<dynamic>? otherNetEarning;
  @JsonKey(name: 'deduction_data')
  List<Datum>? deductionData;
  @JsonKey(name: 'other_earning')
  String? otherEarning;
  @JsonKey(name: 'other_deduction')
  String? otherDeduction;
  @JsonKey(name: 'gross_salary')
  String? grossSalary;
  @JsonKey(name: 'total_deduction_salary')
  String? totalDeductionSalary;
  @JsonKey(name: 'a_b')
  String? aB;
  @JsonKey(name: 'total_net_salary')
  String? totalNetSalary;
  @JsonKey(name: 'amount_in_word')
  String? amountInWord;
  @JsonKey(name: 'amount_in_words')
  String? amountInWords;
  @JsonKey(name: 'payslip_download_url')
  String? payslipDownloadUrl;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'status')
  String? status;

  SalaryDetailsModel({
    this.salarySlipId,
    this.totalMonthDays,
    this.leaveDays,
    this.extraDays,
    this.paidWeekOff,
    this.paidHolidays,
    this.totalWorkingDays,
    this.salaryTypeCurrent,
    this.totalCtcCost,
    this.totalSpecialAllowance,
    this.daySalary,
    this.salaryMonthYear,
    this.salaryMode,
    this.totalContri,
    this.contriData,
    this.earningData,
    this.specialEarningData,
    this.expenseAmount,
    this.hasReimbursement,
    this.otherNetEarning,
    this.deductionData,
    this.otherEarning,
    this.otherDeduction,
    this.grossSalary,
    this.totalDeductionSalary,
    this.aB,
    this.totalNetSalary,
    this.amountInWord,
    this.amountInWords,
    this.payslipDownloadUrl,
    this.message,
    this.status,
  });

  factory SalaryDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$SalaryDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalaryDetailsModelToJson(this);

  SalaryDetailsEntity toEntity() => SalaryDetailsEntity(
    salarySlipId: salarySlipId,
    totalMonthDays: totalMonthDays,
    leaveDays: leaveDays,
    extraDays: extraDays,
    paidWeekOff: paidWeekOff,
    paidHolidays: paidHolidays,
    totalWorkingDays: totalWorkingDays,
    salaryTypeCurrent: salaryTypeCurrent,
    totalCtcCost: totalCtcCost,
    totalSpecialAllowance: totalSpecialAllowance,
    daySalary: daySalary,
    salaryMonthYear: salaryMonthYear,
    salaryMode: salaryMode,
    totalContri: totalContri,
    contriData: contriData?.map((e) => e.toEntity()).toList(),
    earningData: earningData?.map((e) => e.toEntity()).toList(),
    specialEarningData: specialEarningData,
    expenseAmount: expenseAmount,
    hasReimbursement: hasReimbursement,
    otherNetEarning: otherNetEarning?.map((e) => e.toEntity()).toList(),
    deductionData: deductionData?.map((e) => e.toEntity()).toList(),
    otherEarning: otherEarning,
    otherDeduction: otherDeduction,
    grossSalary: grossSalary,
    totalDeductionSalary: totalDeductionSalary,
    aB: aB,
    totalNetSalary: totalNetSalary,
    amountInWord: amountInWord,
    amountInWords: amountInWords,
    payslipDownloadUrl: payslipDownloadUrl,
    message: message,
    status: status,
  );
}

@JsonSerializable()
class Datum {
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'value')
  String? value;

  Datum({this.title, this.value});

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  DatumEntity toEntity() => DatumEntity(title: title, value: value);
}
