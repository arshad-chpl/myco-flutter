class WorkAllocationRequest {
  final String? tag;
  final String? companyId;
  final String? userId;
  final String? workAllocationAddAccess;
  final bool? filterMonth;
  final String? filterYear;

  WorkAllocationRequest({
    this.tag,
    this.companyId,
    this.userId,
    this.workAllocationAddAccess,
    this.filterMonth,
    this.filterYear,
  });

  Map<String, dynamic> toJson() => {
    'getWorkAllocation': tag,
    'society_id': companyId,
    'user_id': userId,
    'work_allocation_add_access': workAllocationAddAccess,
    'filter_month': filterMonth,
    'filter_year': filterYear,
  };
}
