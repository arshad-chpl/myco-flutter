//======== Payslip Details =========

import 'package:equatable/equatable.dart';

sealed class PayslipDetailsEvent extends Equatable {
  const PayslipDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetSalaryDetailsEvent extends PayslipDetailsEvent {
  final String salarySlipId;

  GetSalaryDetailsEvent({required this.salarySlipId});

  @override
  // TODO: implement props
  List<Object> get props => [salarySlipId];
}

class AddSalaryIssueEvent extends PayslipDetailsEvent {
  final String issueMessage;
  final String salarySlipId;

  const AddSalaryIssueEvent({
    required this.issueMessage,
    required this.salarySlipId,
  });

  @override
  List<Object> get props => [issueMessage, salarySlipId];
}
