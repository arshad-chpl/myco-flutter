// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalaryModel _$SalaryModelFromJson(Map<String, dynamic> json) => SalaryModel(
      salary: (json['salary'] as List<dynamic>?)
          ?.map((e) => Salary.fromJson(e as Map<String, dynamic>))
          .toList(),
      earningsTotal: (json['earnings_total'] as List<dynamic>?)
          ?.map((e) => EarningsTotal.fromJson(e as Map<String, dynamic>))
          .toList(),
      deductionsTotal: (json['deductions_total'] as List<dynamic>?)
          ?.map((e) => DeductionsTotal.fromJson(e as Map<String, dynamic>))
          .toList(),
      employerContributionTotal:
          (json['employer_contribution_total'] as List<dynamic>?)
              ?.map((e) =>
                  EmployerContributionTotal.fromJson(e as Map<String, dynamic>))
              .toList(),
      payslipDownloadUrl: json['payslip_download_url'] as String?,
      totalEarning: json['total_earning'] as String?,
      totalDeductions: json['total_deductions'] as String?,
      totalEmployerContibution: json['total_employer_contibution'] as String?,
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$SalaryModelToJson(SalaryModel instance) =>
    <String, dynamic>{
      'salary': instance.salary,
      'earnings_total': instance.earningsTotal,
      'deductions_total': instance.deductionsTotal,
      'employer_contribution_total': instance.employerContributionTotal,
      'payslip_download_url': instance.payslipDownloadUrl,
      'total_earning': instance.totalEarning,
      'total_deductions': instance.totalDeductions,
      'total_employer_contibution': instance.totalEmployerContibution,
      'message': instance.message,
      'status': instance.status,
    };

DeductionsTotal _$DeductionsTotalFromJson(Map<String, dynamic> json) =>
    DeductionsTotal(
      deductionType: json['deduction_type'] as String?,
      deductionAmount: json['deduction_amount'] as String?,
    );

Map<String, dynamic> _$DeductionsTotalToJson(DeductionsTotal instance) =>
    <String, dynamic>{
      'deduction_type': instance.deductionType,
      'deduction_amount': instance.deductionAmount,
    };

EarningsTotal _$EarningsTotalFromJson(Map<String, dynamic> json) =>
    EarningsTotal(
      earningType: json['earning_type'] as String?,
      earningAmount: json['earning_amount'] as String?,
    );

Map<String, dynamic> _$EarningsTotalToJson(EarningsTotal instance) =>
    <String, dynamic>{
      'earning_type': instance.earningType,
      'earning_amount': instance.earningAmount,
    };

EmployerContributionTotal _$EmployerContributionTotalFromJson(
        Map<String, dynamic> json) =>
    EmployerContributionTotal(
      deductionType: json['deduction_type'] as String?,
      employerContributionAmount:
          json['employer_contribution_amount'] as String?,
    );

Map<String, dynamic> _$EmployerContributionTotalToJson(
        EmployerContributionTotal instance) =>
    <String, dynamic>{
      'deduction_type': instance.deductionType,
      'employer_contribution_amount': instance.employerContributionAmount,
    };

Salary _$SalaryFromJson(Map<String, dynamic> json) => Salary(
      salarySlipId: json['salary_slip_id'] as String?,
      salaryId: json['salary_id'] as String?,
      salaryTypeCurrent: json['salary_type_current'] as String?,
      monthName: json['monthName'] as String?,
      year: json['year'] as String?,
      totalDeductionSalary: json['total_deduction_salary'] as String?,
      totalEarningSalary: json['total_earning_salary'] as String?,
      totalNetSalary: json['total_net_salary'] as String?,
      monthNetSalary: json['month_net_salary'] as String?,
      hasSpecialAllowance: json['has_special_allowance'] as bool?,
      totalSpecialAllowance: json['total_special_allowance'] as String?,
      payslipDownloadUrl: json['payslip_download_url'] as String?,
    );

Map<String, dynamic> _$SalaryToJson(Salary instance) => <String, dynamic>{
      'salary_slip_id': instance.salarySlipId,
      'salary_id': instance.salaryId,
      'salary_type_current': instance.salaryTypeCurrent,
      'monthName': instance.monthName,
      'year': instance.year,
      'total_deduction_salary': instance.totalDeductionSalary,
      'total_earning_salary': instance.totalEarningSalary,
      'total_net_salary': instance.totalNetSalary,
      'month_net_salary': instance.monthNetSalary,
      'has_special_allowance': instance.hasSpecialAllowance,
      'total_special_allowance': instance.totalSpecialAllowance,
      'payslip_download_url': instance.payslipDownloadUrl,
    };
