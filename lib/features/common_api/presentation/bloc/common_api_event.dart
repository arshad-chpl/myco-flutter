part of 'common_api_bloc.dart';

abstract class CommonApiEvent extends Equatable {
  const CommonApiEvent();

  @override
  List<Object> get props => [];
}

class LoadUploaded extends CommonApiEvent {}


class LoadBranch extends CommonApiEvent {}

class LoadFloorUnit extends CommonApiEvent {
  final String branchId;

  const LoadFloorUnit(this.branchId);

  @override
  List<Object> get props => [branchId];
}

class LoadShift extends CommonApiEvent {
  final String floorId;

  const LoadShift(this.floorId);

  @override
  List<Object> get props => [floorId];
}



