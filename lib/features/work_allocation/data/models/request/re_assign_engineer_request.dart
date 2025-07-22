class ReAssignEngineerRequest {
  final String? reassign;
  final String? companyId;
  final String? workAllocationId;
  final String? assignedEngineerId;
  final String? workAllocationAddAccess;
  final String? assignedEngineerName;

  const ReAssignEngineerRequest({
    this.reassign,
    this.companyId,
    this.workAllocationId,
    this.assignedEngineerId,
    this.workAllocationAddAccess,
    this.assignedEngineerName,
});

  Map<String, dynamic> toJson() => {
    'reAssign': reassign,
    'society_id': companyId,
    'work_allocation_id': workAllocationId,
    'assigned_engineer_id': assignedEngineerId,
    'work_allocation_add_access': workAllocationAddAccess,
    'assigned_engineer_name': assignedEngineerName,
  };
}