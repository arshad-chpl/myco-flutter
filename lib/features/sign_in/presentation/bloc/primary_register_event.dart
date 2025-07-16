part of 'primary_register_bloc.dart';

abstract class PrimaryRegisterEvent extends Equatable {
  const PrimaryRegisterEvent();

  @override
  List<Object> get props => [];
}

class LoadBranch extends PrimaryRegisterEvent {}

class LoadFloorUnit extends PrimaryRegisterEvent {
  final String branchId;

  const LoadFloorUnit(this.branchId);

  @override
  List<Object> get props => [branchId];
}

class LoadShift extends PrimaryRegisterEvent {
  final String floorId;

  const LoadShift(this.floorId);

  @override
  List<Object> get props => [floorId];
}


class LoadAddPrimaryUser extends PrimaryRegisterEvent {
  final Map<String, dynamic> dataMap;

  const LoadAddPrimaryUser(this.dataMap);

  @override
  List<Object> get props => [dataMap];
}



