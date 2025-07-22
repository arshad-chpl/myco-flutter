import 'package:equatable/equatable.dart';

class HodApprovalEntity extends Equatable {
  final String? hodApproval;
  final String? companyId;
  final String? assignedEngineerId;
  final String? workAllocationId;
  final String? hodId;
  final String? hodCompletionRemark;
  final String? hodName;
  final String? completionRemark;
  final String? assignedEngineerName;
  final String? workAllocationAddAccess;

  const HodApprovalEntity({
    this.hodApproval,
    this.companyId,
    this.assignedEngineerId,
    this.workAllocationId,
    this.hodId,
    this.hodCompletionRemark,
    this.hodName,
    this.completionRemark,
    this.assignedEngineerName,
    this.workAllocationAddAccess,
  });

  @override
  List<Object?> get props => [
    hodApproval,
    companyId,
    assignedEngineerId,
    workAllocationId,
    hodId,
    hodCompletionRemark,
    hodName,
    completionRemark,
    assignedEngineerName,
    workAllocationAddAccess,
  ];
}
