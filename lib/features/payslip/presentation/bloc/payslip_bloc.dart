import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/payslip/domain/entities/ctc_details_entity.dart';
import 'package:myco_flutter/features/payslip/domain/entities/get_other_earnings_entity.dart';
import 'package:myco_flutter/features/payslip/domain/entities/salary_details_entity.dart';
import 'package:myco_flutter/features/payslip/domain/entities/salary_entity.dart';
import 'package:myco_flutter/features/payslip/domain/usecases/get_ctc_details.dart';
import 'package:myco_flutter/features/payslip/domain/usecases/get_other_earnings.dart';
import 'package:myco_flutter/features/payslip/domain/usecases/get_salary.dart';
import 'package:myco_flutter/features/payslip/domain/usecases/get_salary_details.dart';

part 'payslip_event.dart';
part 'payslip_state.dart';

class PayslipBloc extends Bloc<PayslipEvent, PayslipState> {
  final GetCtcDetails getCtcDetails;
  final GetSalary getSalary;
  final GetOtherEarnings getOtherEarnings;
  final GetSalaryDetails getSalaryDetails;

  PayslipBloc(
    this.getCtcDetails,
    this.getSalary,
    this.getOtherEarnings,
    this.getSalaryDetails,
  ) : super(PayslipInitial()) {
    on<GetCtcDetailsEvent>(getCtcDetail);
    on<GetSalaryEvent>(getPayslip);
    // on<GetOtherEarningsEvent>(getOtherEarningsEvent);
    on<GetSalaryDetailsEvent>(getSalaryDetail);
  }

  FutureOr<void> getCtcDetail(
    GetCtcDetailsEvent event,
    Emitter<PayslipState> emit,
  ) async {
    emit(GetCtcDetailsLoadingState());

    final result = await getCtcDetails();
    log(result.toString(), name: "THIS IS RESULT OF CTC");
    result.fold(
      (failure) => emit(GetCtcDetailsErrorState(error: failure.message)),
      (response) => emit(GetCtcDetailsSuccessState(ctcDetails: response)),
    );
  }

  FutureOr<void> getPayslip(
    GetSalaryEvent event,
    Emitter<PayslipState> emit,
  ) async {
    log('getPaySlip called', name: 'GetPayslipEvent');
    emit(GetSalaryLoadingState());

    final result = await getSalary();
    log(result.toString(), name: "THIS IS RESULT OF SALARY");

    result.fold(
      (failure) => emit(GetSalaryErrorState(error: failure.message)),
      (response) => emit(GetSalarySuccessState(salary: response)),
    );
  }

  // FutureOr<void> getOtherEarningsEvent(
  //   GetOtherEarningsEvent event,
  //   Emitter<PayslipState> emit,
  // ) async {
  //   log('getOtherEarnings called', name: 'GetOtherEarningsEvent');
  //   emit(GetOtherEarningsLoadingState());

  //   final result = await getOtherEarnings();
  //   log(result.toString(), name: "THIS IS RESULT OF OTHER EARNINGS");

  //   result.fold(
  //     (failure) => emit(GetOtherEarningsErrorState(error: failure.message)),
  //     (response) => emit(GetOtherEarningsSuccessState(otherEarnings: response)),
  //   );
  // }

  FutureOr<void> getSalaryDetail(
    GetSalaryDetailsEvent event,
    Emitter<PayslipState> emit,
  ) async {
    emit(GetSalaryDetailsLoadingState());

    final result = await getSalaryDetails();

    // log(result, name: 'THIS IS RESULT OF SALARY DETAILS');

    result.fold(
      (failure) => emit(GetSalaryDetailsErrorState(error: failure.message)),
      (response) => emit(GetSalaryDetailsSuccessState(salaryDetails: response)),
    );
  }
}

class OtherEarningsBloc extends Bloc<PayslipEvent, PayslipState> {
  final GetOtherEarnings getOtherEarnings;

  OtherEarningsBloc(this.getOtherEarnings) : super(PayslipInitial()) {
    on<GetOtherEarningsEvent>(getOtherEarningsEvent);
  }

  FutureOr<void> getOtherEarningsEvent(
    GetOtherEarningsEvent event,
    Emitter<PayslipState> emit,
  ) async {
    log('getOtherEarnings called', name: 'GetOtherEarningsEvent');
    emit(GetOtherEarningsLoadingState());

    final result = await getOtherEarnings();
    log(result.toString(), name: "THIS IS RESULT OF OTHER EARNINGS");

    result.fold(
      (failure) => emit(GetOtherEarningsErrorState(error: failure.message)),

      (response) => emit(GetOtherEarningsSuccessState(otherEarnings: response)),
    );
  }
}
