// Salary Details states

import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/payslip/domain/entities/salary_details_entity.dart';

sealed class PayslipDetailsState extends Equatable {
  const PayslipDetailsState();

  @override
  List<Object> get props => [];
}

final class PayslipDetailsInitial extends PayslipDetailsState {}

class GetSalaryDetailsLoadingState extends PayslipDetailsState {}

class GetSalaryDetailsErrorState extends PayslipDetailsState {
  final String error;
  const GetSalaryDetailsErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

class GetSalaryDetailsSuccessState extends PayslipDetailsState {
  final SalaryDetailsEntity salaryDetails;

  const GetSalaryDetailsSuccessState({required this.salaryDetails});
  @override
  List<Object> get props => [salaryDetails];
}

// Add Salary Issue State

class AddSalaryIssueSuccessState extends PayslipDetailsState {
  final String? response;
  const AddSalaryIssueSuccessState({required this.response});

  @override
  List<Object> get props => [?response];
}

class AddSalaryIssueFailureState extends PayslipDetailsState {
  final String message;

  const AddSalaryIssueFailureState({required this.message});

  @override
  List<Object> get props => [message];
}
