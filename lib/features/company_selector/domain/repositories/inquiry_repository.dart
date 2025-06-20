import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_society_model.dart';

abstract class InquiryRepository {
  Future<Either<Failure,CommonResponse>> requestSociety(RequestSociety request
  );
}
