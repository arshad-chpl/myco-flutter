class SalaryDetailsEntity {
  final String? salarySlipId;
  final String? totalMonthDays;
  final String? leaveDays;
  final String? extraDays;
  final String? paidWeekOff;
  final String? paidHolidays;
  final String? totalWorkingDays;
  final String? salaryTypeCurrent;
  final String? totalCtcCost;
  final String? totalSpecialAllowance;
  final String? daySalary;
  final String? salaryMonthYear;
  final String? salaryMode;
  final String? totalContri;
  final List<DatumEntity?>? contriData;
  final List<DatumEntity?>? earningData;
  final dynamic specialEarningData;
  final String? expenseAmount;
  final bool? hasReimbursement;
  final List<dynamic>? otherNetEarning;
  final List<DatumEntity?>? deductionData;
  final String? otherEarning;
  final String? otherDeduction;
  final String? grossSalary;
  final String? totalDeductionSalary;
  final String? aB;
  final String? totalNetSalary;
  final String? amountInWord;
  final String? amountInWords;
  final String? payslipDownloadUrl;
  final String? message;
  final String? status;

  const SalaryDetailsEntity({
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
}

class DatumEntity {
  final String? title;
  final String? value;

  const DatumEntity({this.title, this.value});
}
