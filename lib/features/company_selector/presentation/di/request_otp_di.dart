import 'package:get_it/get_it.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/request_otp_remote_data_source.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/request_otp_remote_data_source_impl.dart';
import 'package:myco_flutter/features/company_selector/data/repositories/request_otp_repository_impl.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/request_otp_repository.dart';
import 'package:myco_flutter/features/company_selector/domain/usecases/request_otp.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/login/login_bloc.dart';

void setupLogin(GetIt sl) {
  // Data source
  sl.registerLazySingleton<RequestOtpRemoteDataSource>(
        () => RequestOtpRemoteDataSourceImpl(dio: sl()),
  );

  // Repository
  sl.registerLazySingleton<RequestOtpRepository>(
        () => RequestOtpRepositoryImpl(sl(), sl()),
  );

  // Use case
  sl.registerLazySingleton<RequestOtp>(
        () => RequestOtp(repository: sl()),
  );

  // Bloc
  sl.registerFactory<LoginBloc>(
        () => LoginBloc(requestOtpRepository: sl()),
  );
}
