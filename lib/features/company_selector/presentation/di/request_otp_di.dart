import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/request_otp_remote_data_source.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/request_otp_remote_data_source_impl.dart';
import 'package:myco_flutter/features/company_selector/data/repositories/request_otp_repository_impl.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/request_otp_repository.dart';
import 'package:myco_flutter/features/company_selector/domain/usecases/request_otp.dart';
import 'package:myco_flutter/features/company_selector/domain/usecases/verify_otp.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/login/login_bloc.dart';

Future<void> setupLoginDi(GetIt sl) async {
  sl.registerLazySingleton<RequestOtpRemoteDataSource>(
        () => RequestOtpRemoteDataSourceImpl(
      dio: sl<Dio>(instanceName: VariableBag.dioWithAuth),
    ),
  );

  sl.registerLazySingleton<RequestOtpRepository>(
        () => RequestOtpRepositoryImpl(sl(), sl()),
  );

  sl.registerLazySingleton<RequestOtp>(
        () => RequestOtp(repository: sl()),
  );

  sl.registerLazySingleton<VerifyOtp>(
        () => VerifyOtp(repository: sl()),
  );

  sl.registerFactory<LoginBloc>(
        () => LoginBloc(
      requestOtp: sl(),
      verifyOtp: sl(),
    ),
  );
}
