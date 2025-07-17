import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/common_api/domain/usecase/common_api_usercase.dart';
import 'package:myco_flutter/features/common_api/models/branch_response.dart';
import 'package:myco_flutter/features/common_api/models/floor_and_unit_response.dart';
import 'package:myco_flutter/features/common_api/models/shift_response.dart';


part 'common_api_event.dart';
part 'common_api_state.dart';

class CommonApiBloc extends Bloc<CommonApiEvent, CommonApiState> {
  final CommonApiUserCase registerUseCase;

  CommonApiBloc({required this.registerUseCase}) : super(CommonInitial()) {
    on<LoadBranch>(_onFetchBranch);
    on<LoadFloorUnit>(_onFetchFloorUnit);
    on<LoadShift>(_onFetchShift);
  }


  void _onFetchBranch(
      LoadBranch event, Emitter<CommonApiState> emit) async {
    emit(CommonApiLoading());
    final Either<Failure, BranchResponse> result = await registerUseCase.callBranch();

    result.fold(
          (failure) => emit(CommonApiError(failure.message)),
          (response) => emit(BlockApiSuccess(response)),
    );
  }


  void _onFetchFloorUnit(LoadFloorUnit event, Emitter<CommonApiState> emit) async {
    emit(CommonApiLoading());
    final Either<Failure, FloorAndUnitResponse> result = await registerUseCase.floorList(event.branchId);

    result.fold(
          (failure) => emit(CommonApiError(failure.message)),
          (response) => emit(FloorUnitApiSuccess(response)),
    );
  }


  void _onFetchShift(LoadShift event, Emitter<CommonApiState> emit) async {
    emit(CommonApiLoading());
    final Either<Failure, ShiftResponse> result = await registerUseCase.callShift(event.floorId);

    result.fold(
          (failure) => emit(CommonApiError(failure.message)),
          (response) => emit(ShiftApiSuccess(response)),
    );
  }


}
