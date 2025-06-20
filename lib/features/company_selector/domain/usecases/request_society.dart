import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_society_model.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/inquiry_repository.dart';

class RequestSocietyUseCase {
  final InquiryRepository repository;
  RequestSocietyUseCase(this.repository);
  Future<Either<Failure, CommonResponse>> call(RequestSociety request) async => repository.requestSociety(request);
  
}