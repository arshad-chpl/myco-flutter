import 'package:equatable/equatable.dart';

class AddWorkAllocationRequestEntity extends Equatable {
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

  const AddWorkAllocationRequestEntity({
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

  @override
  List<Object?> get props => [
    addWorkAllocation,
    companyId,
    hodId,
    assignedEngineerId,
    workCategoryId,
    projectName,
    site,
    location,
    startDate,
    endDate,
    hodRemark,
    userName,
    workCategoryName,
    assignName,
  ];
}