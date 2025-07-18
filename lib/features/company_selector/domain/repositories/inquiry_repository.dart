import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/request_society_model.dart';

abstract class InquiryRepository {
  Future<Either<Failure, CommonResponseModelEntity>> requestSociety(
    RequestSociety request,
  );
}
