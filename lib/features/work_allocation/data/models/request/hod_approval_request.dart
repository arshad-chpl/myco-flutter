class HodApprovalRequest {
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

  const HodApprovalRequest({
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


  Map<String, dynamic> toJson() => {
    'hodApproval': hodApproval,
    'society_id': companyId,
    'assigned_engineer_id': assignedEngineerId,
    'work_allocation_id': workAllocationId,
    'hod_id': hodId,
    'hod_completion_remark': hodCompletionRemark,
    'hod_name': hodName,
    'completion_remark': completionRemark,
    'assigned_engineer_name': assignedEngineerName,
    'work_allocation_add_access': workAllocationAddAccess,
  };
}