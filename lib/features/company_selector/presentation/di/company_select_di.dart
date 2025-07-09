import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/company_remote_data_source.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/company_remote_data_source_impl.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/inquiry_remote_data_source.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/inquiry_remote_data_source_impl.dart';
import 'package:myco_flutter/features/company_selector/data/repositories/company_repository_impl.dart';
import 'package:myco_flutter/features/company_selector/data/repositories/inquiry_repository_impl.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/company_repository.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/inquiry_repository.dart';
import 'package:myco_flutter/features/company_selector/domain/usecases/request_society.dart';
import 'package:myco_flutter/features/company_selector/domain/usecases/search_company.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/inquiry/inquiry_bloc.dart';

Future<void>  companySelectorDi(GetIt sl) async {
  // Register the CompanyRemoteDataSource
  sl.registerLazySingleton<CompanyRemoteDataSource>(
    CompanyRemoteDataSourceImpl.new,
  );

  // Register the CompanyRepository with its implementation
  sl.registerLazySingleton<CompanyRepository>(
    () =>
        CompanyRepositoryImpl(sl<SafeApiCall>(), sl<CompanyRemoteDataSource>()),
  );

  // Register the SearchCompanyUseCase
  sl.registerLazySingleton<SearchCompanyUseCase>(
    () => SearchCompanyUseCase(sl<CompanyRepository>()),
  );

  // Register the CompanyBloc
  sl.registerFactory(() => CompanyBloc(sl<SearchCompanyUseCase>()));
}

Future<void> InquiryDi(GetIt sl) async {
  // Register the InquiryRemoteDataSource
  sl.registerLazySingleton<InquiryRemoteDataSource>(
    InquiryRemoteDataSourceImpl.new,
  );

  // Register the InquiryRepository with its implementation
  sl.registerLazySingleton<InquiryRepository>(
    () =>
        InquiryRepositoryImpl(sl<InquiryRemoteDataSource>(), sl<SafeApiCall>()),
  );

  // Register the RequestSocietyUseCase
  sl.registerLazySingleton<RequestSocietyUseCase>(
    () => RequestSocietyUseCase(sl<InquiryRepository>()),
  );
  // Register the InquiryBloc
  sl.registerFactory(() => InquiryBloc(sl<RequestSocietyUseCase>()));
}
