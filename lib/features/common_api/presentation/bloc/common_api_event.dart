part of 'common_api_bloc.dart';

abstract class CommonApiEvent extends Equatable {
  const CommonApiEvent();

  @override
  List<Object> get props => [];
}


// uploaded image and pdf api
class LoadUploaded extends CommonApiEvent {

  final bool loginType;
  final List<String> filePath;

  const LoadUploaded(
      this.loginType,
      this.filePath);

  @override
  List<Object> get props => [loginType, filePath];
}


class LoadBranch extends CommonApiEvent {
  final String societyId;
  final String userId;

  const LoadBranch(this.societyId,this.userId);

  @override
  List<Object> get props => [societyId,userId];
}

class LoadFloorUnit extends CommonApiEvent {
  final String societyId;
  final String branchId;

  const LoadFloorUnit(this.societyId,this.branchId);

  @override
  List<Object> get props => [societyId,branchId];
}

class LoadShift extends CommonApiEvent {
  final String societyId;
  final String floorId;

  const LoadShift(this.societyId,this.floorId);

  @override
  List<Object> get props => [societyId,floorId];
}



