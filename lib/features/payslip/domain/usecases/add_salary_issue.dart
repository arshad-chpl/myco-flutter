import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/payslip/domain/repositories/payslip_repository.dart';

class AddSalaryIssue {
  final PayslipRepository repository;

  AddSalaryIssue({required this.repository});

  Future<Either<Failure, CommonResponseModelEntity>> call(
    String issueMessage,
    String salarySlipId,
  ) => repository.addSalaryIssue(issueMessage, salarySlipId);
}
