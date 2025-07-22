class SalaryEntity {
  final List<SalaryItemEntity>? salaryItem;
  final List<EarningsTotalEntity>? earningsTotal;
  final List<DeductionsTotalEntity>? deductionsTotal;
  final List<EmployerContributionTotalEntity>? employerContributionTotal;
  final String? payslipDownloadUrl;
  final String? totalEarning;
  final String? totalDeductions;
  final String? totalEmployerContibution;
  final String? message;
  final String? status;

  SalaryEntity({
    this.salaryItem,
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
}

class SalaryItemEntity {
  final String? salarySlipId;
  final String? salaryId;
  final String? salaryTypeCurrent;
  final String? monthName;
  final String? year;
  final String? totalDeductionSalary;
  final String? totalEarningSalary;
  final String? totalNetSalary;
  final String? monthNetSalary;
  final bool? hasSpecialAllowance;
  final String? totalSpecialAllowance;
  final String? payslipDownloadUrl;

  SalaryItemEntity({
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
}

class EarningsTotalEntity {
  final String? earningType;
  final String? earningAmount;

  EarningsTotalEntity({this.earningType, this.earningAmount});
}

class DeductionsTotalEntity {
  final String? deductionType;
  final String? deductionAmount;

  DeductionsTotalEntity({this.deductionType, this.deductionAmount});
}

class EmployerContributionTotalEntity {
  final String? deductionType;
  final String? employerContributionAmount;

  EmployerContributionTotalEntity({
    this.deductionType,
    this.employerContributionAmount,
  });
}
