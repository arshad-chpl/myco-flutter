part of 'payslip_bloc.dart';

sealed class PayslipEvent extends Equatable {
  const PayslipEvent();

  @override
  List<Object> get props => [];
}

class GetCtcDetailsEvent extends PayslipEvent {}

class GetSalaryEvent extends PayslipEvent {}

class GetOtherEarningsEvent extends PayslipEvent {}

class GetSalaryDetailsEvent extends PayslipEvent {}
