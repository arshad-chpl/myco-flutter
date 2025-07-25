import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/payslip/domain/entities/ctc_details_entity.dart';
import 'package:myco_flutter/features/payslip/domain/entities/get_other_earnings_entity.dart';
import 'package:myco_flutter/features/payslip/domain/entities/salary_details_entity.dart';
import 'package:myco_flutter/features/payslip/domain/entities/salary_entity.dart';

abstract class PayslipRepository {
  Future<Either<Failure, CtcDetailsEntity>> getCtcDetails();
  Future<Either<Failure, SalaryEntity>> getSalary();
  Future<Either<Failure, GetOtherEarningsEntity>> getOtherEarnings();
  Future<Either<Failure, SalaryDetailsEntity>> getSalaryDetails(
    String salarySlipId,
  );
  Future<Either<Failure, CommonResponseModelEntity>> addSalaryIssue(
    String issueMessage,
    String salarySlipId,
  );
}
