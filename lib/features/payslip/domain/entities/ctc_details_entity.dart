// domain/entities/ctc_details_entity.dart

class CtcDetailsEntity {
  final bool? lastMonthSalaryGenerated;
  final String? salaryType;
  final List<EarningHeadEntity>? earningHeads;
  final List<CtcHeadEntity>? ctcHeads;
  final List<DeductionHeadEntity>? deductionHeads;
  final String? ctcPerMonth;
  final String? ctcPerAnnum;
  final String? salaryPerMonth;
  final String? salaryPerAnnum;
  final String? deductPerMonth;
  final String? deductPerAnnum;
  final String? netSalaryPerMonthInHand;
  final String? netSalaryPerMonthInHandAdvanceSalary;
  final String? netSalaryPerMonthInHandWord;
  final String? netSalaryPerAnnumInHand;
  final String? netSalaryPerAnnumInHandWord;
  final String? message;
  final String? status;

  CtcDetailsEntity({
    this.lastMonthSalaryGenerated,
    this.salaryType,
    this.earningHeads,
    this.ctcHeads,
    this.deductionHeads,
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
}

class CtcHeadEntity {
  final String? headName;
  final String? ctcPerMonth;
  final String? ctcPerAnnum;

  CtcHeadEntity({this.headName, this.ctcPerMonth, this.ctcPerAnnum});
}

class DeductionHeadEntity {
  final String? headName;
  final String? perMonth;
  final String? perAnnum;

  DeductionHeadEntity({this.headName, this.perMonth, this.perAnnum});
}

class EarningHeadEntity {
  final String? headName;
  final String? salaryPerMonth;
  final String? salaryPerAnnum;

  EarningHeadEntity({this.headName, this.salaryPerMonth, this.salaryPerAnnum});
}
