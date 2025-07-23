class TaskCompletionRequest {
  final String? taskCompletion;
  final String? companyId;
  final String? workAllocationId;
  final String? workAllocationAddAccess;
  final String? assignedEngineerId;
  final String? hodId;
  final String? assignedEngineerName;
  final String? completionDateByEng;
  final String? engineerCompletionRemark;

  const TaskCompletionRequest({
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


  Map<String, dynamic> toJson() => {
    'taskCompletion': taskCompletion,
    'society_id': companyId,
    'work_allocation_id': workAllocationId,
    'work_allocation_add_access': workAllocationAddAccess,
    'assigned_engineer_id': assignedEngineerId,
    'hod_id': hodId,
    'assigned_engineer_name': assignedEngineerName,
    'completion_date_by_eng': completionDateByEng,
    'engineer_completion_remark': engineerCompletionRemark,
  };
}