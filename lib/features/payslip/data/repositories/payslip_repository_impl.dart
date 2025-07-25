import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/payslip/data/datasources/payslip_remote_datasources.dart';
import 'package:myco_flutter/features/payslip/domain/entities/ctc_details_entity.dart';
import 'package:myco_flutter/features/payslip/domain/entities/get_other_earnings_entity.dart';
import 'package:myco_flutter/features/payslip/domain/entities/salary_details_entity.dart';
import 'package:myco_flutter/features/payslip/domain/entities/salary_entity.dart';
import 'package:myco_flutter/features/payslip/domain/repositories/payslip_repository.dart';

class PayslipRepositoryImpl implements PayslipRepository {
  final PayslipRemoteDatasources remoteDatasources;
  final SafeApiCall safeApiCall;

  PayslipRepositoryImpl(this.safeApiCall, this.remoteDatasources);

  @override
  Future<Either<Failure, CtcDetailsEntity>> getCtcDetails() async {
    final result = await safeApiCall.execute(remoteDatasources.getCtcDetails);

    return result.map((responseModel) => responseModel.toEntity());
  }

  @override
  Future<Either<Failure, SalaryEntity>> getSalary() async {
    final result = await safeApiCall.execute(remoteDatasources.getSalary);

    return result.map((responseModel) => responseModel.toEntity());
  }

  @override
  Future<Either<Failure, GetOtherEarningsEntity>> getOtherEarnings() async {
    final result = await safeApiCall.execute(
      remoteDatasources.getOtherEarnings,
    );

    return result.map((responseModel) => responseModel.toEntity());
  }

  @override
  Future<Either<Failure, SalaryDetailsEntity>> getSalaryDetails(
    String salarySlipId,
  ) async {
    final result = await safeApiCall.execute(
      () => remoteDatasources.getSalaryDetails(salarySlipId),
    );

    return result.map((responseModel) => responseModel.toEntity());
  }

  @override
  Future<Either<Failure, CommonResponseModelEntity>> addSalaryIssue(
    String issueMessage,
    String salarySlipId,
  ) async {
    final result = await safeApiCall.execute(
      () => remoteDatasources.addSalaryIssue(issueMessage, salarySlipId),
    );

    return result.map((responseModel) => responseModel.toEntity());
  }
}
