import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/payslip/domain/entities/ctc_details_entity.dart';
import 'package:myco_flutter/features/payslip/domain/repositories/payslip_repository.dart';

class GetCtcDetails {
  final PayslipRepository repository;

  GetCtcDetails({required this.repository});

  Future<Either<Failure, CtcDetailsEntity>> call() =>
      repository.getCtcDetails();
}
