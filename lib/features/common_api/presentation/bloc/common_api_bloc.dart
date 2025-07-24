import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/common_api/domain/entities/Branch_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/entities/floor_and_unit_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/entities/shift_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/entities/uploaded_file_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/usecase/common_api_usercase.dart';


part 'common_api_event.dart';
part 'common_api_state.dart';

class CommonApiBloc extends Bloc<CommonApiEvent, CommonApiState> {
  final CommonApiUserCase registerUseCase;

  CommonApiBloc({required this.registerUseCase}) : super(CommonInitial()) {

    //upload image and Pdf api
    on<UploadAttachments>(_onFetchUploadAttachments);

    on<LoadBranch>(_onFetchBranch);
    on<LoadDepartmentAndDesignation>(_onFetchDepartmentAndDesignation);
    on<LoadShift>(_onFetchShift);
  }


  // uploaded image and pdf api
  void _onFetchUploadAttachments(UploadAttachments event, Emitter<CommonApiState> emit) async {
    emit(CommonApiLoading());
    final Either<Failure, UploadFileResponseEntity> result = await registerUseCase.uploadAttachments(event.loginType, event.filePath);

    result.fold(
          (failure) => emit(CommonApiError(failure.message)),
          (response) => emit(UploadImagePdfApiSuccess(response)),
    );
  }




  void _onFetchBranch(
      LoadBranch event, Emitter<CommonApiState> emit) async {
    emit(CommonApiLoading());
    final Either<Failure, BranchResponseEntity> result = await registerUseCase.callBranch(event.companyId,event.userId);

    result.fold(
          (failure) => emit(CommonApiError(failure.message)),
          (response) => emit(BlockApiSuccess(response)),
    );
  }


  void _onFetchDepartmentAndDesignation(LoadDepartmentAndDesignation event, Emitter<CommonApiState> emit) async {
    emit(CommonApiLoading());
    final Either<Failure, FloorAndUnitResponseEntity> result = await registerUseCase.getDepartmentAndDesignation(event.companyId,event.branchId);

    result.fold(
          (failure) => emit(CommonApiError(failure.message)),
          (response) => emit(FloorUnitApiSuccess(response)),
    );
  }


  void _onFetchShift(LoadShift event, Emitter<CommonApiState> emit) async {
    emit(CommonApiLoading());
    final Either<Failure, ShiftResponseEntity> result = await registerUseCase.callShift(event.companyId,event.floorId);

    result.fold(
          (failure) => emit(CommonApiError(failure.message)),
          (response) => emit(ShiftApiSuccess(response)),
    );
  }


}
