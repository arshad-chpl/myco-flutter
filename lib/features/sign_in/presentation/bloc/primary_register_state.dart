part of 'primary_register_bloc.dart';

abstract class PrimaryRegisterState extends Equatable {
  const PrimaryRegisterState();

  @override
  List<Object> get props => [];
}

class PrimaryRegisterInitial extends PrimaryRegisterState {}

class PrimaryRegisterLoading extends PrimaryRegisterState {}

class BlockApiSuccess extends PrimaryRegisterState {
  final BranchResponse blockList;
  const BlockApiSuccess(this.blockList);

  @override
  List<Object> get props => [blockList];
}


class FloorUnitApiSuccess extends PrimaryRegisterState {
  final FloorAndUnitResponse floorUnitList;
  const FloorUnitApiSuccess(this.floorUnitList);

  @override
  List<Object> get props => [floorUnitList];
}

class ShiftApiSuccess extends PrimaryRegisterState {
  final ShiftResponse shiftList;
  const ShiftApiSuccess(this.shiftList);

  @override
  List<Object> get props => [shiftList];
}

class AddPrimaryUserApiSuccess extends PrimaryRegisterState {
  final CommonResponse response;
  const AddPrimaryUserApiSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class PrimaryRegisterError extends PrimaryRegisterState {
  final String message;
  const PrimaryRegisterError(this.message);

  @override
  List<Object> get props => [message];
}