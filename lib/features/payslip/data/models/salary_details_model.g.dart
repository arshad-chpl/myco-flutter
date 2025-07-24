// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalaryDetailsModel _$SalaryDetailsModelFromJson(Map<String, dynamic> json) =>
    SalaryDetailsModel(
      salarySlipId: json['salary_slip_id'] as String?,
      totalMonthDays: json['total_month_days'] as String?,
      leaveDays: json['leave_days'] as String?,
      extraDays: json['extra_days'] as String?,
      paidWeekOff: json['paid_week_off'] as String?,
      paidHolidays: json['paid_holidays'] as String?,
      totalWorkingDays: json['total_working_days'] as String?,
      salaryTypeCurrent: json['salary_type_current'] as String?,
      totalCtcCost: json['total_ctc_cost'] as String?,
      totalSpecialAllowance: json['total_special_allowance'] as String?,
      daySalary: json['day_salary'] as String?,
      salaryMonthYear: json['salary_month_year'] as String?,
      salaryMode: json['salary_mode'] as String?,
      totalContri: json['total_contri'] as String?,
      contriData:
          (json['contri_data'] as List<dynamic>?)
              ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
              .toList(),
      earningData:
          (json['earning_data'] as List<dynamic>?)
              ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
              .toList(),
      specialEarningData: json['special_earning_data'],
      expenseAmount: json['expense_amount'] as String?,
      hasReimbursement: json['has_reimbursement'] as bool?,
      otherNetEarning: json['other_net_earning'] as List<dynamic>?,
      deductionData:
          (json['deduction_data'] as List<dynamic>?)
              ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
              .toList(),
      otherEarning: json['other_earning'] as String?,
      otherDeduction: json['other_deduction'] as String?,
      grossSalary: json['gross_salary'] as String?,
      totalDeductionSalary: json['total_deduction_salary'] as String?,
      aB: json['a_b'] as String?,
      totalNetSalary: json['total_net_salary'] as String?,
      amountInWord: json['amount_in_word'] as String?,
      amountInWords: json['amount_in_words'] as String?,
      payslipDownloadUrl: json['payslip_download_url'] as String?,
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$SalaryDetailsModelToJson(SalaryDetailsModel instance) =>
    <String, dynamic>{
      'salary_slip_id': instance.salarySlipId,
      'total_month_days': instance.totalMonthDays,
      'leave_days': instance.leaveDays,
      'extra_days': instance.extraDays,
      'paid_week_off': instance.paidWeekOff,
      'paid_holidays': instance.paidHolidays,
      'total_working_days': instance.totalWorkingDays,
      'salary_type_current': instance.salaryTypeCurrent,
      'total_ctc_cost': instance.totalCtcCost,
      'total_special_allowance': instance.totalSpecialAllowance,
      'day_salary': instance.daySalary,
      'salary_month_year': instance.salaryMonthYear,
      'salary_mode': instance.salaryMode,
      'total_contri': instance.totalContri,
      'contri_data': instance.contriData,
      'earning_data': instance.earningData,
      'special_earning_data': instance.specialEarningData,
      'expense_amount': instance.expenseAmount,
      'has_reimbursement': instance.hasReimbursement,
      'other_net_earning': instance.otherNetEarning,
      'deduction_data': instance.deductionData,
      'other_earning': instance.otherEarning,
      'other_deduction': instance.otherDeduction,
      'gross_salary': instance.grossSalary,
      'total_deduction_salary': instance.totalDeductionSalary,
      'a_b': instance.aB,
      'total_net_salary': instance.totalNetSalary,
      'amount_in_word': instance.amountInWord,
      'amount_in_words': instance.amountInWords,
      'payslip_download_url': instance.payslipDownloadUrl,
      'message': instance.message,
      'status': instance.status,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) =>
    Datum(title: json['title'] as String?, value: json['value'] as String?);

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
  'title': instance.title,
  'value': instance.value,
};
