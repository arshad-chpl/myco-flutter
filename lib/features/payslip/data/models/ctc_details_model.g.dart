// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ctc_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CtcDetailsModel _$CtcDetailsModelFromJson(Map<String, dynamic> json) =>
    CtcDetailsModel(
      lastMonthSalaryGenerated: json['last_month_salary_generated'] as bool?,
      salaryType: json['salary_type'] as String?,
      earningHeadName:
          (json['earning_head_name'] as List<dynamic>?)
              ?.map((e) => EarningHeadName.fromJson(e as Map<String, dynamic>))
              .toList(),
      ctcHeadName:
          (json['ctc_head_name'] as List<dynamic>?)
              ?.map((e) => CtcHeadName.fromJson(e as Map<String, dynamic>))
              .toList(),
      deductionHeadName:
          (json['deduction_head_name'] as List<dynamic>?)
              ?.map(
                (e) => DeductionHeadName.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      ctcPerMonth: json['ctc_per_month'] as String?,
      ctcPerAnnum: json['ctc_per_annum'] as String?,
      salaryPerMonth: json['salary_per_month'] as String?,
      salaryPerAnnum: json['salary_per_annum'] as String?,
      deductPerMonth: json['deduct_per_month'] as String?,
      deductPerAnnum: json['deduct_per_annum'] as String?,
      netSalaryPerMonthInHand: json['net_salary_per_month_in_hand'] as String?,
      netSalaryPerMonthInHandAdvanceSalary:
          json['net_salary_per_month_in_hand_advance_salary'] as String?,
      netSalaryPerMonthInHandWord:
          json['net_salary_per_month_in_hand_word'] as String?,
      netSalaryPerAnnumInHand: json['net_salary_per_annum_in_hand'] as String?,
      netSalaryPerAnnumInHandWord:
          json['net_salary_per_annum_in_hand_word'] as String?,
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CtcDetailsModelToJson(CtcDetailsModel instance) =>
    <String, dynamic>{
      'last_month_salary_generated': instance.lastMonthSalaryGenerated,
      'salary_type': instance.salaryType,
      'earning_head_name': instance.earningHeadName,
      'ctc_head_name': instance.ctcHeadName,
      'deduction_head_name': instance.deductionHeadName,
      'ctc_per_month': instance.ctcPerMonth,
      'ctc_per_annum': instance.ctcPerAnnum,
      'salary_per_month': instance.salaryPerMonth,
      'salary_per_annum': instance.salaryPerAnnum,
      'deduct_per_month': instance.deductPerMonth,
      'deduct_per_annum': instance.deductPerAnnum,
      'net_salary_per_month_in_hand': instance.netSalaryPerMonthInHand,
      'net_salary_per_month_in_hand_advance_salary':
          instance.netSalaryPerMonthInHandAdvanceSalary,
      'net_salary_per_month_in_hand_word': instance.netSalaryPerMonthInHandWord,
      'net_salary_per_annum_in_hand': instance.netSalaryPerAnnumInHand,
      'net_salary_per_annum_in_hand_word': instance.netSalaryPerAnnumInHandWord,
      'message': instance.message,
      'status': instance.status,
    };

CtcHeadName _$CtcHeadNameFromJson(Map<String, dynamic> json) => CtcHeadName(
  headName: json['head_name'] as String?,
  ctcPerMonth: json['ctc_per_month'] as String?,
  ctcPerAnnum: json['ctc_per_annum'] as String?,
);

Map<String, dynamic> _$CtcHeadNameToJson(CtcHeadName instance) =>
    <String, dynamic>{
      'head_name': instance.headName,
      'ctc_per_month': instance.ctcPerMonth,
      'ctc_per_annum': instance.ctcPerAnnum,
    };

DeductionHeadName _$DeductionHeadNameFromJson(Map<String, dynamic> json) =>
    DeductionHeadName(
      headName: json['head_name'] as String?,
      perMonth: json['per_month'] as String?,
      perAnnum: json['per_annum'] as String?,
    );

Map<String, dynamic> _$DeductionHeadNameToJson(DeductionHeadName instance) =>
    <String, dynamic>{
      'head_name': instance.headName,
      'per_month': instance.perMonth,
      'per_annum': instance.perAnnum,
    };

EarningHeadName _$EarningHeadNameFromJson(Map<String, dynamic> json) =>
    EarningHeadName(
      headName: json['head_name'] as String?,
      salaryPerMonth: json['salary_per_month'] as String?,
      salaryPerAnnum: json['salary_per_annum'] as String?,
    );

Map<String, dynamic> _$EarningHeadNameToJson(EarningHeadName instance) =>
    <String, dynamic>{
      'head_name': instance.headName,
      'salary_per_month': instance.salaryPerMonth,
      'salary_per_annum': instance.salaryPerAnnum,
    };
