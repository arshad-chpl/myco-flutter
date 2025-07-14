class DepartmentModel {
  final String blockId;
  final String floorId;
  final String departmentName;

  DepartmentModel({
    required this.blockId,
    required this.floorId,
    required this.departmentName,
  });

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      blockId: json['block_id'].toString(),
      floorId: json['floor_id'].toString(),
      departmentName: json['department_name'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DepartmentModel &&
              runtimeType == other.runtimeType &&
              blockId == other.blockId &&
              floorId == other.floorId;

  @override
  int get hashCode => Object.hash(blockId, floorId);

  @override
  String toString() => 'DepartmentModel($blockId, $floorId, $departmentName)';

  factory DepartmentModel.empty() {
    return DepartmentModel(
      floorId: '',
      departmentName: '',
      blockId: '',
    );
  }

}
