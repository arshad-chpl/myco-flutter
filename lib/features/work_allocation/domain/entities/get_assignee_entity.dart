import 'package:equatable/equatable.dart';

class GetAssigneeDetailsRequestEntity extends Equatable {
  final String? getAssigneeDetails;
  final String? companyId;
  final String? workAllocationAddAccess;
  final String? workAllocationId;

  const GetAssigneeDetailsRequestEntity({
    this.getAssigneeDetails,
    this.companyId,
    this.workAllocationAddAccess,
    this.workAllocationId,
  });

  @override
  List<Object?> get props => [
    getAssigneeDetails,
    companyId,
    workAllocationAddAccess,
    workAllocationId,
  ];
}

class GetAssigneeResponseEntity extends Equatable {
  final String? message;
  final String? status;
  final String? workAllocationId;
  final String? assignedEngineerId;
  final String? hodId;
  final String? userFullName;
  final String? userDesignation;
  final String? shortName;
  final String? userProfilePic;
  final String? floorName;
  final String? blockName;
  final String? workCategoryId;
  final String? workCategoryName;
  final String? projectName;
  final String? site;
  final String? location;
  final String? hodRemark;
  final String? engineerRemark;
  final String? startDate;
  final String? endDate;
  final String? startDateView;
  final String? endDateView;
  final String? engineerStatus;
  final String? hodRemarka;
  final String? completionDateByEngg;
  final String? completionDateByEnggView;
  final String? engineerCompletionRemark;
  final String? authorizedDateByHod;
  final String? authorizedDateByHodView;
  final String? completionRemark;
  final String? hodCompletionRemark;
  final String? isReassigned;
  final String? createdDate;
  final String? updatedDate;
  final String? updatedByName;

  const GetAssigneeResponseEntity({
    this.message,
    this.status,
    this.workAllocationId,
    this.assignedEngineerId,
    this.hodId,
    this.userFullName,
    this.userDesignation,
    this.shortName,
    this.userProfilePic,
    this.floorName,
    this.blockName,
    this.workCategoryId,
    this.workCategoryName,
    this.projectName,
    this.site,
    this.location,
    this.hodRemark,
    this.engineerRemark,
    this.startDate,
    this.endDate,
    this.startDateView,
    this.endDateView,
    this.engineerStatus,
    this.hodRemarka,
    this.completionDateByEngg,
    this.completionDateByEnggView,
    this.engineerCompletionRemark,
    this.authorizedDateByHod,
    this.authorizedDateByHodView,
    this.completionRemark,
    this.hodCompletionRemark,
    this.isReassigned,
    this.createdDate,
    this.updatedDate,
    this.updatedByName,
  });

  @override
  List<Object?> get props => [
    message,
    status,
    workAllocationId,
    assignedEngineerId,
    hodId,
    userFullName,
    userDesignation,
    shortName,
    userProfilePic,
    floorName,
    blockName,
    workCategoryId,
    workCategoryName,
    projectName,
    site,
    location,
    hodRemark,
    engineerRemark,
    startDate,
    endDate,
    startDateView,
    endDateView,
    engineerStatus,
    hodRemarka,
    completionDateByEngg,
    completionDateByEnggView,
    engineerCompletionRemark,
    authorizedDateByHod,
    authorizedDateByHodView,
    completionRemark,
    hodCompletionRemark,
    isReassigned,
    createdDate,
    updatedDate,
    updatedByName,
  ];
}