class TaskApprovalRequest {
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

  TaskApprovalRequest({
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

  Map<String, dynamic> toJson() => {
    'taskApproval': taskApproval,
    'society_id': companyId,
    'assigned_engineer_id': assignedEngineerId,
    'work_allocation_id': workAllocationId,
    'engineer_status': engineerStatus,
    'engineer_remark': engineerRemark,
    'hod_id': hodId,
    'project_name': projectName,
    'work_category_name': workCategoryName,
    'assigned_engineer_name': assignedEngineerName,
    'work_allocation_add_access': workAllocationAddAccess,
    'hod_name': hodName,
  };

}