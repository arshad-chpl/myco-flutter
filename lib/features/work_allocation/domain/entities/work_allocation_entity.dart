import 'package:equatable/equatable.dart';

class WorkAllocationResponseEntity extends Equatable {
  final String? message;
  final String? status;
  final List<WorkAllocationListEntity>? workAllocation;

  const WorkAllocationResponseEntity({
    this.message,
    this.status,
    this.workAllocation,
  });

  @override
  List<Object?> get props => [message, status, workAllocation];
}

class WorkAllocationListEntity extends Equatable {
  final String? workAllocationId;
  final String? companyId;
  final String? hodId;
  final String? assignedEngineerId;
  final String? userFullName;
  final String? workCategoryName;
  final String? shortName;
  final String? userProfilePic;
  final String? userDesignation;
  final String? blockName;
  final String? floorName;
  final String? workCategoryId;
  final String? projectName;
  final String? site;
  final String? location;
  final String? startDate;
  final String? endDate;
  final String? startDateView;
  final String? endDateView;
  final String? engineerStatus;
  final String? completionDateByEngg;
  final String? authorizedDateByHod;
  final String? createdDate;
  final String? isReassigned;

  const WorkAllocationListEntity({
    this.workAllocationId,
    this.companyId,
    this.hodId,
    this.assignedEngineerId,
    this.userFullName,
    this.workCategoryName,
    this.shortName,
    this.userProfilePic,
    this.userDesignation,
    this.blockName,
    this.floorName,
    this.workCategoryId,
    this.projectName,
    this.site,
    this.location,
    this.startDate,
    this.endDate,
    this.startDateView,
    this.endDateView,
    this.engineerStatus,
    this.completionDateByEngg,
    this.authorizedDateByHod,
    this.createdDate,
    this.isReassigned,
  });

  @override
  List<Object?> get props => [
    workAllocationId,
    companyId,
    hodId,
    assignedEngineerId,
    userFullName,
    workCategoryName,
    shortName,
    userProfilePic,
    userDesignation,
    blockName,
    floorName,
    workCategoryId,
    projectName,
    site,
    location,
    startDate,
    endDate,
    startDateView,
    endDateView,
    engineerStatus,
    completionDateByEngg,
    authorizedDateByHod,
    createdDate,
    isReassigned,
  ];
}
