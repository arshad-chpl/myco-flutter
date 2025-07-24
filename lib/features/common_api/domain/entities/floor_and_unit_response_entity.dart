import 'package:equatable/equatable.dart';

class FloorAndUnitResponseEntity extends Equatable {
  final List<DesignationEntity>? designation;
  final List<FloorEntity>? floors;
  final List<SubDepartmentEntity>? subDepartmentList;
  final String? message;
  final String? status;

  const FloorAndUnitResponseEntity({
    this.designation,
    this.floors,
    this.subDepartmentList,
    this.message,
    this.status,
  });

  @override
  List<Object?> get props => [
    designation,
    floors,
    subDepartmentList,
    message,
    status,
  ];
}

class DesignationEntity extends Equatable {
  final String? designationId;
  final String? designationName;

  const DesignationEntity({
    this.designationId,
    this.designationName,
  });

  @override
  List<Object?> get props => [designationId, designationName];
}

class FloorEntity extends Equatable {
  final String? floorId;
  final String? societyId;
  final String? blockId;
  final String? floorName;
  final String? floorStatus;

  const FloorEntity({
    this.floorId,
    this.societyId,
    this.blockId,
    this.floorName,
    this.floorStatus,
  });

  @override
  List<Object?> get props => [
    floorId,
    societyId,
    blockId,
    floorName,
    floorStatus,
  ];
}

class SubDepartmentEntity extends Equatable {
  final String? subDepartmentId;
  final String? societyId;
  final String? blockId;
  final String? floorId;
  final String? subDepartmentName;

  const SubDepartmentEntity({
    this.subDepartmentId,
    this.societyId,
    this.blockId,
    this.floorId,
    this.subDepartmentName,
  });

  @override
  List<Object?> get props => [
    subDepartmentId,
    societyId,
    blockId,
    floorId,
    subDepartmentName,
  ];
}
