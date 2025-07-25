// Payslip Details Blox
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/payslip/domain/usecases/add_salary_issue.dart';
import 'package:myco_flutter/features/payslip/domain/usecases/get_salary_details.dart';
import 'package:myco_flutter/features/payslip/presentation/bloc/payslip_details_bloc/payslip_details_event.dart';
import 'package:myco_flutter/features/payslip/presentation/bloc/payslip_details_bloc/payslip_details_state.dart';

class PayslipDetailBloc extends Bloc<PayslipDetailsEvent, PayslipDetailsState> {
  final GetSalaryDetails getSalaryDetails;
  final AddSalaryIssue addSalaryIssue;

  PayslipDetailBloc(this.getSalaryDetails, this.addSalaryIssue)
    : super(PayslipDetailsInitial()) {
    on<GetSalaryDetailsEvent>(getSalaryDetail);
    on<AddSalaryIssueEvent>(raiseSalaryIssue);
  }

  FutureOr<void> getSalaryDetail(
    GetSalaryDetailsEvent event,
    Emitter<PayslipDetailsState> emit,
  ) async {
    emit(GetSalaryDetailsLoadingState());

    final result = await getSalaryDetails.call(event.salarySlipId);

    // log(result, name: 'THIS IS RESULT OF SALARY DETAILS');

    result.fold(
      (failure) => emit(GetSalaryDetailsErrorState(error: failure.message)),
      (response) => emit(GetSalaryDetailsSuccessState(salaryDetails: response)),
    );
  }

  FutureOr<void> raiseSalaryIssue(
    AddSalaryIssueEvent event,
    Emitter<PayslipDetailsState> emit,
  ) async {
    final result = await addSalaryIssue.call(
      event.issueMessage,
      event.salarySlipId,
    );

    result.fold(
      (failure) => emit(AddSalaryIssueFailureState(message: failure.message)),
      (response) =>
          emit(AddSalaryIssueSuccessState(response: response.message)),
    );
  }
}
