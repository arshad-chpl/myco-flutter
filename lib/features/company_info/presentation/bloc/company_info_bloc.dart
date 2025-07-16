import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/company_info/domain/use_cases/get_company_info.dart';
import 'package:myco_flutter/features/company_info/presentation/bloc/company_info_event.dart';
import 'package:myco_flutter/features/company_info/presentation/bloc/company_info_state.dart';

class CompanyInfoBloc extends Bloc<CompanyInfoEvent, CompanyInfoState> {
  final GetCompanyInfo getCompanyInfo;

  CompanyInfoBloc({required this.getCompanyInfo}) : super(CompanyInfoInitial()) {
    on<FetchCompanyInfo>(_onFetchCompanyInfo);
  }

  void _onFetchCompanyInfo(
      FetchCompanyInfo event, Emitter<CompanyInfoState> emit) async {
    emit(CompanyInfoLoading());
    final result = await getCompanyInfo();

    result.fold(
          (failure) => emit(CompanyInfoError(failure.message ?? 'Unexpected Error')),
          (companyInfo) => emit(CompanyInfoLoaded(companyInfo)),
    );
  }
}
