part of 'common_api_bloc.dart';

abstract class CommonApiState extends Equatable {
  const CommonApiState();

  @override
  List<Object> get props => [];
}

class CommonInitial extends CommonApiState {}

class CommonApiLoading extends CommonApiState {}

class BlockApiSuccess extends CommonApiState {
  final BranchResponse blockList;
  const BlockApiSuccess(this.blockList);

  @override
  List<Object> get props => [blockList];
}


class FloorUnitApiSuccess extends CommonApiState {
  final FloorAndUnitResponse floorUnitList;
  const FloorUnitApiSuccess(this.floorUnitList);

  @override
  List<Object> get props => [floorUnitList];
}

class ShiftApiSuccess extends CommonApiState {
  final ShiftResponse shiftList;
  const ShiftApiSuccess(this.shiftList);

  @override
  List<Object> get props => [shiftList];
}

class CommonApiError extends CommonApiState {
  final String message;
  const CommonApiError(this.message);

  @override
  List<Object> get props => [message];
}