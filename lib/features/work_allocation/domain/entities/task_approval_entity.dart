import 'package:equatable/equatable.dart';

class TaskApprovalEntity extends Equatable {
  final String? taskApproval;
  final String? companyId;
  final String? assignedEngineerId;
  final String? workAllocationId;
  final String? engineerStatus;
  final String? engineerRemark;
  final String? hodId;
  final String? projectName;
  final String? workCategoryName;
  final String? assignedEngineerName;
  final String? workAllocationAddAccess;
  final String? hodName;

  const TaskApprovalEntity({
    this.taskApproval,
    this.companyId,
    this.assignedEngineerId,
    this.workAllocationId,
    this.engineerStatus,
    this.engineerRemark,
    this.hodId,
    this.projectName,
    this.workCategoryName,
    this.assignedEngineerName,
    this.workAllocationAddAccess,
    this.hodName,
  });

  @override
  List<Object?> get props => [
    taskApproval,
    companyId,
    assignedEngineerId,
    workAllocationId,
    engineerStatus,
    engineerRemark,
    hodId,
    projectName,
    workCategoryName,
    assignedEngineerName,
    workAllocationAddAccess,
    hodName,
  ];
}