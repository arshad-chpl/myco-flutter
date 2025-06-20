import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/company_remote_data_source.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/inquiry_remote_data_source.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_society_model.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/inquiry_repository.dart';


class InquiryRepositoryImpl extends InquiryRepository{
  InquiryRemoteDataSource remoteDataSource;
  SafeApiCall safeApiCall;
  InquiryRepositoryImpl(this.remoteDataSource,this.safeApiCall);

  @override
  Future<Either<Failure,CommonResponse>> requestSociety(RequestSociety request

  ) async => safeApiCall.execute(()=>remoteDataSource.requestSociety(request
      
    ));
}