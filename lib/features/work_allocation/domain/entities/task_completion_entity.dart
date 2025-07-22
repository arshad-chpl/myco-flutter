import 'package:equatable/equatable.dart';

class TaskCompletionEntity extends Equatable {
  final String? taskCompletion;
  final String? companyId;
  final String? workAllocationId;
  final String? workAllocationAddAccess;
  final String? assignedEngineerId;
  final String? hodId;
  final String? assignedEngineerName;
  final String? completionDateByEng;
  final String? engineerCompletionRemark;

  const TaskCompletionEntity({
    this.taskCompletion,
    this.companyId,
    this.workAllocationId,
    this.workAllocationAddAccess,
    this.assignedEngineerId,
    this.hodId,
    this.assignedEngineerName,
    this.completionDateByEng,
    this.engineerCompletionRemark,
  });

  @override
  List<Object?> get props => [
    taskCompletion,
    companyId,
    workAllocationId,
    workAllocationAddAccess,
    assignedEngineerId,
    hodId,
    assignedEngineerName,
    completionDateByEng,
    engineerCompletionRemark,
  ];
}