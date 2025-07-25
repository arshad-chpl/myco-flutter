import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/payslip/domain/entities/salary_details_entity.dart';
import 'package:myco_flutter/features/payslip/domain/repositories/payslip_repository.dart';

class GetSalaryDetails {
  final PayslipRepository repository;

  GetSalaryDetails({required this.repository});

  Future<Either<Failure, SalaryDetailsEntity>> call(
    String salarySlipId,
  ) async => await repository.getSalaryDetails(salarySlipId);
}
