part of 'common_api_bloc.dart';

abstract class CommonApiState extends Equatable {
  const CommonApiState();

  @override
  List<Object> get props => [];
}

class CommonInitial extends CommonApiState {}

class CommonApiLoading extends CommonApiState {}


// block api success
class UploadImagePdfApiSuccess extends CommonApiState {
  final UploadFileResponseEntity blockList;
  const UploadImagePdfApiSuccess(this.blockList);

  @override
  List<Object> get props => [blockList];
}

// block api error
class UploadImagePdfApiError extends CommonApiState {
  final String message;
  const UploadImagePdfApiError(this.message);

  @override
  List<Object> get props => [message];
}

// block api success
class BlockApiSuccess extends CommonApiState {
  final BranchResponseEntity blockList;
  const BlockApiSuccess(this.blockList);

  @override
  List<Object> get props => [blockList];
}

// block api error
class BlockApiError extends CommonApiState {
  final String message;
  const BlockApiError(this.message);

  @override
  List<Object> get props => [message];
}

// floor unit api error
class FloorUnitApiSuccess extends CommonApiState {
  final FloorAndUnitResponseEntity floorUnitList;
  const FloorUnitApiSuccess(this.floorUnitList);

  @override
  List<Object> get props => [floorUnitList];
}

// floor unit  api error
class FloorUnitApiError extends CommonApiState {
  final String message;
  const FloorUnitApiError(this.message);

  @override
  List<Object> get props => [message];
}

// Shift api error
class ShiftApiSuccess extends CommonApiState {
  final ShiftResponseEntity shiftList;
  const ShiftApiSuccess(this.shiftList);

  @override
  List<Object> get props => [shiftList];
}

// Shift api error
class ShiftApiError extends CommonApiState {
  final String message;
  const ShiftApiError(this.message);

  @override
  List<Object> get props => [message];
}


class CommonApiError extends CommonApiState {
  final String message;
  const CommonApiError(this.message);

  @override
  List<Object> get props => [message];
}