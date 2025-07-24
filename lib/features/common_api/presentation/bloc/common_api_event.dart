part of 'common_api_bloc.dart';

abstract class CommonApiEvent extends Equatable {
  const CommonApiEvent();

  @override
  List<Object> get props => [];
}


// uploaded image and pdf api
class UploadAttachments extends CommonApiEvent {

  final bool loginType;
  final List<String> filePath;

  const UploadAttachments(
      this.loginType,
      this.filePath);

  @override
  List<Object> get props => [loginType, filePath];
}


class LoadBranch extends CommonApiEvent {
  final String companyId;
  final String userId;

  const LoadBranch(this.companyId,this.userId);

  @override
  List<Object> get props => [companyId,userId];
}

class LoadDepartmentAndDesignation extends CommonApiEvent {
  final String companyId;
  final String branchId;

  const LoadDepartmentAndDesignation(this.companyId,this.branchId);

  @override
  List<Object> get props => [companyId,branchId];
}

class LoadShift extends CommonApiEvent {
  final String companyId;
  final String floorId;

  const LoadShift(this.companyId,this.floorId);

  @override
  List<Object> get props => [companyId,floorId];
}



