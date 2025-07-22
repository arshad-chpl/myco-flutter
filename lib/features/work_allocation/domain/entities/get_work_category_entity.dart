import 'package:equatable/equatable.dart';

class GetWorkCategoryResponseEntity extends Equatable {
  final String? message;
  final String? status;
  final List<WorkCategoryListEntity>? workCategory;

  const GetWorkCategoryResponseEntity({
    this.message,
    this.status,
    this.workCategory,
  });

  @override
  List<Object?> get props => [message, status, workCategory];
}

class WorkCategoryListEntity extends Equatable {
  final String? workCategoryId;
  final String? workCategoryName;

  const WorkCategoryListEntity({this.workCategoryId, this.workCategoryName});

  @override
  List<Object?> get props => [workCategoryId, workCategoryName];
}
