part of 'payslip_bloc.dart';

sealed class PayslipState extends Equatable {
  const PayslipState();

  @override
  List<Object> get props => [];
}

final class PayslipInitial extends PayslipState {}

// ============ Get salary states =============
class GetSalaryLoadingState extends PayslipState {}

class GetSalaryErrorState extends PayslipState {
  final String error;
  const GetSalaryErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

class GetSalarySuccessState extends PayslipState {
  final SalaryEntity salary;

  const GetSalarySuccessState({required this.salary});

  @override
  List<Object> get props => [salary];
}

// ============== Get Other Earnings states =============
class GetOtherEarningsLoadingState extends PayslipState {}

class GetOtherEarningsErrorState extends PayslipState {
  final String error;
  const GetOtherEarningsErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

class GetOtherEarningsSuccessState extends PayslipState {
  final GetOtherEarningsEntity otherEarnings;

  const GetOtherEarningsSuccessState({required this.otherEarnings});

  @override
  List<Object> get props => [otherEarnings];
}
