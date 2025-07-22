// To parse this JSON data, do
//
//     final salaryModel = salaryModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/payslip/domain/entities/salary_entity.dart';

part 'salary_model.g.dart';

SalaryModel salaryModelFromJson(String str) =>
    SalaryModel.fromJson(json.decode(str));

String salaryModelToJson(SalaryModel data) => json.encode(data.toJson());

@JsonSerializable()
class SalaryModel {
  @JsonKey(name: 'salary')
  List<Salary>? salary;
  @JsonKey(name: 'earnings_total')
  List<EarningsTotal>? earningsTotal;
  @JsonKey(name: 'deductions_total')
  List<DeductionsTotal>? deductionsTotal;
  @JsonKey(name: 'employer_contribution_total')
  List<EmployerContributionTotal>? employerContributionTotal;
  @JsonKey(name: 'payslip_download_url')
  String? payslipDownloadUrl;
  @JsonKey(name: 'total_earning')
  String? totalEarning;
  @JsonKey(name: 'total_deductions')
  String? totalDeductions;
  @JsonKey(name: 'total_employer_contibution')
  String? totalEmployerContibution;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'status')
  String? status;

  SalaryModel({
    this.salary,
    this.earningsTotal,
    this.deductionsTotal,
    this.employerContributionTotal,
    this.payslipDownloadUrl,
    this.totalEarning,
    this.totalDeductions,
    this.totalEmployerContibution,
    this.message,
    this.status,
  });

  factory SalaryModel.fromJson(Map<String, dynamic> json) =>
      _$SalaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalaryModelToJson(this);

  SalaryEntity toEntity() => SalaryEntity(
    salaryItem: salary?.map((salary) => salary.toEntity()).toList(),
    earningsTotal: earningsTotal
        ?.map((earningsTotal) => earningsTotal.toEntity())
        .toList(),
    deductionsTotal: deductionsTotal
        ?.map((deductionsTotal) => deductionsTotal.toEntity())
        .toList(),
    employerContributionTotal: employerContributionTotal
        ?.map(
          (employerContributionTotal) => employerContributionTotal.toEntity(),
        )
        .toList(),
    payslipDownloadUrl: payslipDownloadUrl,
    totalEarning: totalEarning,
    totalDeductions: totalDeductions,
    totalEmployerContibution: totalEmployerContibution,
    message: message,
    status: status,
  );
}

@JsonSerializable()
class DeductionsTotal {
  @JsonKey(name: 'deduction_type')
  String? deductionType;
  @JsonKey(name: 'deduction_amount')
  String? deductionAmount;

  DeductionsTotal({this.deductionType, this.deductionAmount});

  factory DeductionsTotal.fromJson(Map<String, dynamic> json) =>
      _$DeductionsTotalFromJson(json);

  Map<String, dynamic> toJson() => _$DeductionsTotalToJson(this);

  DeductionsTotalEntity toEntity() => DeductionsTotalEntity(
    deductionType: deductionType,
    deductionAmount: deductionAmount,
  );
}

@JsonSerializable()
class EarningsTotal {
  @JsonKey(name: 'earning_type')
  String? earningType;
  @JsonKey(name: 'earning_amount')
  String? earningAmount;

  EarningsTotal({this.earningType, this.earningAmount});

  factory EarningsTotal.fromJson(Map<String, dynamic> json) =>
      _$EarningsTotalFromJson(json);

  Map<String, dynamic> toJson() => _$EarningsTotalToJson(this);

  EarningsTotalEntity toEntity() => EarningsTotalEntity(
    earningType: earningType,
    earningAmount: earningAmount,
  );
}

@JsonSerializable()
class EmployerContributionTotal {
  @JsonKey(name: 'deduction_type')
  String? deductionType;
  @JsonKey(name: 'employer_contribution_amount')
  String? employerContributionAmount;

  EmployerContributionTotal({
    this.deductionType,
    this.employerContributionAmount,
  });

  factory EmployerContributionTotal.fromJson(Map<String, dynamic> json) =>
      _$EmployerContributionTotalFromJson(json);

  Map<String, dynamic> toJson() => _$EmployerContributionTotalToJson(this);

  EmployerContributionTotalEntity toEntity() => EmployerContributionTotalEntity(
    deductionType: deductionType,
    employerContributionAmount: employerContributionAmount,
  );
}

@JsonSerializable()
class Salary {
  @JsonKey(name: 'salary_slip_id')
  String? salarySlipId;
  @JsonKey(name: 'salary_id')
  String? salaryId;
  @JsonKey(name: 'salary_type_current')
  String? salaryTypeCurrent;
  @JsonKey(name: 'monthName')
  String? monthName;
  @JsonKey(name: 'year')
  String? year;
  @JsonKey(name: 'total_deduction_salary')
  String? totalDeductionSalary;
  @JsonKey(name: 'total_earning_salary')
  String? totalEarningSalary;
  @JsonKey(name: 'total_net_salary')
  String? totalNetSalary;
  @JsonKey(name: 'month_net_salary')
  String? monthNetSalary;
  @JsonKey(name: 'has_special_allowance')
  bool? hasSpecialAllowance;
  @JsonKey(name: 'total_special_allowance')
  String? totalSpecialAllowance;
  @JsonKey(name: 'payslip_download_url')
  String? payslipDownloadUrl;

  Salary({
    this.salarySlipId,
    this.salaryId,
    this.salaryTypeCurrent,
    this.monthName,
    this.year,
    this.totalDeductionSalary,
    this.totalEarningSalary,
    this.totalNetSalary,
    this.monthNetSalary,
    this.hasSpecialAllowance,
    this.totalSpecialAllowance,
    this.payslipDownloadUrl,
  });

  factory Salary.fromJson(Map<String, dynamic> json) => _$SalaryFromJson(json);

  Map<String, dynamic> toJson() => _$SalaryToJson(this);

  SalaryItemEntity toEntity() => SalaryItemEntity(
    salarySlipId: salarySlipId,
    salaryId: salaryId,
    salaryTypeCurrent: salaryTypeCurrent,
    monthName: monthName,
    year: year,
    totalDeductionSalary: totalDeductionSalary,
    totalEarningSalary: totalEarningSalary,
    totalNetSalary: totalNetSalary,
    monthNetSalary: monthNetSalary,
    hasSpecialAllowance: hasSpecialAllowance,
    totalSpecialAllowance: totalSpecialAllowance,
    payslipDownloadUrl: payslipDownloadUrl,
  );
}
