part of 'payslip_bloc.dart';

//======== Payslip =========

sealed class PayslipEvent extends Equatable {
  const PayslipEvent();

  @override
  List<Object> get props => [];
}

class GetSalaryEvent extends PayslipEvent {}

// ======== Other Earning =========

class GetOtherEarningsEvent extends PayslipEvent {}
