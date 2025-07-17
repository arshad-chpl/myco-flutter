import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/sign_in/domain/usecases/primary_register_usecase.dart';
import 'package:myco_flutter/features/sign_in/models/branch_response.dart';
import 'package:myco_flutter/features/sign_in/models/floor_and_unit_response.dart';
import 'package:myco_flutter/features/sign_in/models/shift_response.dart';

part 'primary_register_event.dart';
part 'primary_register_state.dart';


class PrimaryRegisterBloc extends Bloc<PrimaryRegisterEvent, PrimaryRegisterState> {
  final PrimaryRegisterUseCase registerUseCase;

  PrimaryRegisterBloc({required this.registerUseCase}) : super(PrimaryRegisterInitial()) {
    on<LoadBranch>(_onFetchBranch);
    on<LoadFloorUnit>(_onFetchFloorUnit);
    on<LoadShift>(_onFetchShift);
    on<LoadAddPrimaryUser>(_onFetchAddPrimaryUser);
  }


  void _onFetchBranch(
      LoadBranch event, Emitter<PrimaryRegisterState> emit) async {
    emit(PrimaryRegisterLoading());
    final Either<Failure, BranchResponse> result = await registerUseCase.callBranch();

    result.fold(
          (failure) => emit(PrimaryRegisterError(failure.message ?? 'Unexpected Error')),
          (response) => emit(BlockApiSuccess(response)),
    );
  }


  void _onFetchFloorUnit(LoadFloorUnit event, Emitter<PrimaryRegisterState> emit) async {
    emit(PrimaryRegisterLoading());
    final Either<Failure, FloorAndUnitResponse> result = await registerUseCase.floorList(event.branchId);

    result.fold(
          (failure) => emit(PrimaryRegisterError(failure.message ?? 'Unexpected Error')),
          (response) => emit(FloorUnitApiSuccess(response)),
    );
  }


  void _onFetchShift(LoadShift event, Emitter<PrimaryRegisterState> emit) async {
    emit(PrimaryRegisterLoading());
    final Either<Failure, ShiftResponse> result = await registerUseCase.callShift(event.floorId);

    result.fold(
          (failure) => emit(PrimaryRegisterError(failure.message ?? 'Unexpected Error')),
          (response) => emit(ShiftApiSuccess(response)),
    );
  }


  void _onFetchAddPrimaryUser(LoadAddPrimaryUser event, Emitter<PrimaryRegisterState> emit) async {
    emit(PrimaryRegisterLoading());
    final Either<Failure, CommonResponse> result = await registerUseCase.callAddPrimaryUser(event.dataMap);

    result.fold(
          (failure) => emit(PrimaryRegisterError(failure.message ?? 'Unexpected Error')),
          (response) => emit(AddPrimaryUserApiSuccess(response)),
    );
  }


}
