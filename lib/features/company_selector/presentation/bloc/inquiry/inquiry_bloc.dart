import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_society_model.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/inquiry_repository.dart';
import 'package:myco_flutter/features/company_selector/domain/usecases/request_society.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/inquiry/inquiry_event.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/inquiry/inquiry_state.dart';
import 'package:package_info_plus/package_info_plus.dart';

class InquiryBloc extends Bloc<InquiryEvent, InquiryState> {
  RequestSocietyUseCase requestSociety;

  InquiryBloc(this.requestSociety) : super(InitialState()) {
    on<FormSubmitted>(_onFormSubmitted);
  }

  Future<void> _onFormSubmitted(
    FormSubmitted event,
    Emitter<InquiryState> emit,
  ) async {
    emit(LoadingState());

    try {
      // if (mobile.isEmpty || mobile.length != 10) {
      //   emit(const ErrorState('Mobile number is invalid'));
      // } else if (name.isEmpty || company.isEmpty || employees.isEmpty) {
      //   emit(const ErrorState('Please fill all required fields'));
      // } else {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();

      final String version = packageInfo.version; // e.g., 1.0.5

      try {
        final results = await requestSociety.call(
          event.requestSociety
            ..device = Platform.isAndroid ? 'android' : 'ios'
            ..inquiryType = 'sales_inquiry'
            ..languageId = '1'
            ..companySearchKeyword = '',
        );
        results.fold(
          (failure) => emit(ErrorState(failure.message)),
          (response) => emit(const SuccessState()),
        );
        // if (results.message!=null) {
        //   emit(SuccessState(message: results.message!));
        // }else{
        //   emit(const ErrorState('Something went wrong. Please try again.'));
        // }
      } catch (e) {
        emit(const ErrorState('Failed to load companies'));
      }
      // }
    } catch (e) {
      emit(const ErrorState('Something went wrong. Please try again.'));
    }
  }
}
