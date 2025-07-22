import 'package:equatable/equatable.dart';

class ReAssignEngineerRequestEntity extends Equatable {
  final String? reassign;
  final String? companyId;
  final String? workAllocationId;
  final String? assignedEngineerId;
  final String? workAllocationAddAccess;
  final String? assignedEngineerName;

  const ReAssignEngineerRequestEntity({
    this.reassign,
    this.companyId,
    this.workAllocationId,
    this.assignedEngineerId,
    this.workAllocationAddAccess,
    this.assignedEngineerName,
  });

  @override
  List<Object?> get props => [
    reassign,
    companyId,
    workAllocationId,
    assignedEngineerId,
    workAllocationAddAccess,
    assignedEngineerName,
  ];
}