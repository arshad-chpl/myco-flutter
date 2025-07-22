class AddWorkAllocationRequest {
  final String? addWorkAllocation;
  final String? companyId;
  final String? hodId;
  final String? assignedEngineerId;
  final String? workCategoryId;
  final String? projectName;
  final String? site;
  final String? location;
  final String? startDate;
  final String? endDate;
  final String? hodRemark;
  final String? userName;
  final String? workCategoryName;
  final String? assignName;

  const AddWorkAllocationRequest({
    this.addWorkAllocation,
    this.companyId,
    this.hodId,
    this.assignedEngineerId,
    this.workCategoryId,
    this.projectName,
    this.site,
    this.location,
    this.startDate,
    this.endDate,
    this.hodRemark,
    this.userName,
    this.workCategoryName,
    this.assignName,
  });

  Map<String, dynamic> toJson() => {
    'addWorkAllocation': addWorkAllocation,
    'society_id': companyId,
    'hod_id': hodId,
    'assigned_engineer_id': assignedEngineerId,
    'work_category_id': workCategoryId,
    'project_name': projectName,
    'site': site,
    'location': location,
    'start_date': startDate,
    'end_date': endDate,
    'hod_remark': hodRemark,
    'user_name': userName,
    'work_category_name': workCategoryName,
    'assign_name': assignName,
  };
}