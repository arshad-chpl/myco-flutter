import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/company_selector/domain/entites/company_response_entity.dart';

part 'select_company_step_event.dart';
part 'select_company_step_state.dart';

class SelectCompanyStepBloc extends Bloc<SelectCompanyStepEvent, SelectCompanyStepState> {
  SelectCompanyStepBloc() : super(SelectCompanyStepInitial()) {
    on<GoToLoginStep>((event, emit) {
      emit(SelectCompanyStepLogin(event.selectedCompany));
    });

    on<GoToOtpStep>((event, emit) {
      emit(SelectCompanyStepOtp(
        otpResponse: event.otpResponse,
        selectedCompany: event.selectedCompany,
        contactValue: event.contactValue,
        countryCode: event.countryCode,
      ));
    });

    on<GoToPreviousStep>((event, emit) {
      if (state is SelectCompanyStepOtp) {
        final currentState = state as SelectCompanyStepOtp;
        emit(SelectCompanyStepLogin(currentState.selectedCompany));
      } else if (state is SelectCompanyStepLogin) {
        emit(SelectCompanyStepInitial());
      }
    });

    on<ResetToInitialStep>((event, emit) {
      emit(SelectCompanyStepInitial());
    });
  }
}
