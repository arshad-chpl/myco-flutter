import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/company_selector/domain/usecases/search_company.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_event.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  SearchCompanyUseCase searchCompany;
  Timer? _debounce;

  CompanyBloc(this.searchCompany) : super(CompanyInitial()) {
    /// Handle the search company event
    on<SearchCompany>((event, emit) async {
      emit(CompanyLoading());

      try {
        final results = await searchCompany.call(event.query);
        results.fold(
          (failure) => emit(CompanyError(failure.message)),
          // If successful, emit loaded state with default index = -1 (none selected)
          (companies) => emit(CompanyLoaded(companies, -1)),
        );
      } catch (e) {
        emit(const CompanyError('Failed to load companies'));
      }
    });

    /// Reset state to initial view
    on<InitialView>((event, emit) async {
      emit(CompanyInitial());
    });

    /// Handle company selection by updating the selected index
    on<CompanyIndex>((event, emit) {
      // Only update if companies are already loaded
      if (state is CompanyLoaded) {
        final loaded = state as CompanyLoaded;
        emit(CompanyLoaded(loaded.companies, event.index));
      }
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
