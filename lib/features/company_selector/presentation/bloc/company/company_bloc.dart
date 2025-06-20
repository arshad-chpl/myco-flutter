import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/company_selector/data/repositories/company_repository_impl.dart';
import 'package:myco_flutter/features/company_selector/domain/usecases/search_company.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_event.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  SearchCompanyUseCase searchCompany; 
  Timer? _debounce;

  CompanyBloc(this.searchCompany) : super(CompanyInitial()) {
    on<SearchCompany>((event, emit) async {
      emit(CompanyLoading());

      try {
        final results = await searchCompany.call(event.query);
        results.fold(
          (failure) => emit(CompanyError(failure.message)),
          (companies) => emit(CompanyLoaded(companies)),
        );
      } catch (e) {
        emit(const CompanyError('Failed to load companies'));
      }
    });

    on<InitialView>((event, emit) async {
      emit(CompanyInitial());
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
