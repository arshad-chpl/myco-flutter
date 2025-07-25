import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/common_api/data/models/request/branch_list_request.dart';
import 'package:myco_flutter/features/common_api/data/models/request/department_and_designation_list_request.dart';
import 'package:myco_flutter/features/common_api/data/models/request/shift_list_request.dart';
import 'package:myco_flutter/features/common_api/domain/entities/Branch_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/entities/floor_and_unit_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/entities/shift_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/entities/uploaded_file_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/usecase/common_api_usercase.dart';

part 'common_api_event.dart';
part 'common_api_state.dart';

class CommonApiBloc extends Bloc<CommonApiEvent, CommonApiState> {
  final CommonApiUserCase commonApiUserCase;


  CommonApiBloc({required this.commonApiUserCase}) : super(CommonInitial()) {

    //upload image and Pdf api
    on<UploadAttachments>(_onFetchUploadAttachments);

    on<LoadBranch>(_onFetchBranch);
    on<LoadDepartmentAndDesignation>(_onFetchDepartmentAndDesignation);
    on<LoadShift>(_onFetchShift);
  }


  // uploaded image and pdf api
  void _onFetchUploadAttachments(UploadAttachments event, Emitter<CommonApiState> emit) async {
    emit(CommonApiLoading());

    final Either<Failure, UploadFileResponseEntity> result = await commonApiUserCase.uploadAttachments(event.loginType, event.filePath);

    result.fold(
          (failure) => emit(CommonApiError(failure.message)),
          (response) => emit(UploadImagePdfApiSuccess(response)),
    );
  }


  void _onFetchBranch(LoadBranch event, Emitter<CommonApiState> emit) async {
    emit(CommonApiLoading());

    final request = BranchListRequest(
      tag: 'getBlocks',
      companyId: event.companyId,
      userId: event.userId,
      languageId: '1'
    );

    final freshResult = await commonApiUserCase.callBranch(request);

    freshResult.fold(
          (failure) => emit(CommonApiError(failure.message)),
          (response) => emit(BlockApiSuccess(response)),
    );
  }




  void _onFetchDepartmentAndDesignation(LoadDepartmentAndDesignation event, Emitter<CommonApiState> emit) async {
    emit(CommonApiLoading());

    print('idBranch: ${event.branchId}');

    final request = DepartmentAndDesignationListRequest(
        tag: 'getFloorandUnitNew',
        companyId: event.companyId,
        branchId: event.branchId,
        languageId: '1'
    );

    final freshResult = await commonApiUserCase.getDepartmentAndDesignation(request);

    freshResult.fold(
          (failure) => emit(CommonApiError(failure.message)),
          (response) => emit(FloorUnitApiSuccess(response)),
    );
  }


  void _onFetchShift(LoadShift event, Emitter<CommonApiState> emit) async {
    emit(CommonApiLoading());

    final request = ShiftListRequest(
        tag: 'getShiftsRegister',
        companyId: event.companyId,
        floorId: event.floorId,
        languageId: '1'
    );

    final freshResult = await commonApiUserCase.callShift(request);

    freshResult.fold(
          (failure) => emit(CommonApiError(failure.message)),
          (response) => emit(ShiftApiSuccess(response)),
    );
  }


}
