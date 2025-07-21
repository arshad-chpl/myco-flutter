import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/request_society_model.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/inquiry_repository.dart';

class RequestSocietyUseCase {
  final InquiryRepository repository;

  RequestSocietyUseCase(this.repository);

  Future<Either<Failure, CommonResponseModelEntity>> call(
    RequestSociety request,
  ) async => repository.requestSociety(request);
}
