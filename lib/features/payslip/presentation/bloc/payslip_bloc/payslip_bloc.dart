import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/payslip/domain/entities/get_other_earnings_entity.dart';
import 'package:myco_flutter/features/payslip/domain/entities/salary_entity.dart';
import 'package:myco_flutter/features/payslip/domain/usecases/get_other_earnings.dart';
import 'package:myco_flutter/features/payslip/domain/usecases/get_salary.dart';

part 'payslip_event.dart';
part 'payslip_state.dart';

class PayslipBloc extends Bloc<PayslipEvent, PayslipState> {
  final GetSalary getSalary;

  PayslipBloc(this.getSalary) : super(PayslipInitial()) {
    on<GetSalaryEvent>(getPayslip);
  }
  FutureOr<void> getPayslip(
    GetSalaryEvent event,
    Emitter<PayslipState> emit,
  ) async {
    emit(GetSalaryLoadingState());

    final result = await getSalary();

    result.fold(
      (failure) => emit(GetSalaryErrorState(error: failure.message)),
      (response) => emit(GetSalarySuccessState(salary: response)),
    );
  }
}

// Get Other Earning Bloc
class OtherEarningsBloc extends Bloc<PayslipEvent, PayslipState> {
  final GetOtherEarnings getOtherEarnings;

  OtherEarningsBloc(this.getOtherEarnings) : super(PayslipInitial()) {
    on<GetOtherEarningsEvent>(getOtherEarningsEvent);
  }

  FutureOr<void> getOtherEarningsEvent(
    GetOtherEarningsEvent event,
    Emitter<PayslipState> emit,
  ) async {
    emit(GetOtherEarningsLoadingState());

    final result = await getOtherEarnings();

    result.fold(
      (failure) => emit(GetOtherEarningsErrorState(error: failure.message)),
      (response) => emit(GetOtherEarningsSuccessState(otherEarnings: response)),
    );
  }
}
