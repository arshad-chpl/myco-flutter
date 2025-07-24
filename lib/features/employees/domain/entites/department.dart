import 'package:equatable/equatable.dart';

class Department extends Equatable {
  final String? floorId;
  final String? societyId;
  final String? blockId;
  final String? blockName;
  final String? departmentName;
  final bool? isMyDepartment;

  const Department({
    this.floorId,
    this.societyId,
    this.blockId,
    this.blockName,
    this.departmentName,
    this.isMyDepartment,
  });

  @override
  List<Object?> get props => [
    floorId,
    societyId,
    blockId,
    blockName,
    departmentName,
    isMyDepartment,
  ];
}
