class GetAssigneeDetailsRequest {
  final String? getAssigneeDetails;
  final String? companyId;
  final String? workAllocationAddAccess;
  final String? workAllocationId;

  const GetAssigneeDetailsRequest({
    this.getAssigneeDetails,
    this.companyId,
    this.workAllocationAddAccess,
    this.workAllocationId,
  });

  Map<String, dynamic> toJson() => {
    'getAssigneeDetails': getAssigneeDetails,
    'society_id': companyId,
    'work_allocation_add_access': workAllocationAddAccess,
    'work_allocation_id': workAllocationId,
  };
}