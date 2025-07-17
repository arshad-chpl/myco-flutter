import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/sign_in/domain/usecases/primary_register_usecase.dart';
import 'package:myco_flutter/features/sign_in/models/view_pending_profile_response.dart';

part 'primary_register_event.dart';
part 'primary_register_state.dart';


class PrimaryRegisterBloc extends Bloc<PrimaryRegisterEvent, PrimaryRegisterState> {
  final PrimaryRegisterUseCase registerUseCase;

  PrimaryRegisterBloc({required this.registerUseCase}) : super(PrimaryRegisterInitial()) {
    on<LoadAddPrimaryUser>(_onFetchAddPrimaryUser);
    
    //pending profile
    on<LoadPendingProfile>(_onFetchPendingProfile);
    on<LoadCancelProfile>(_onFetchCancelProfile);
    on<LoadReminderProfile>(_onFetchReminderProfile);
    on<LoadSociety>(_onFetchSociety);
  }


  void _onFetchAddPrimaryUser(LoadAddPrimaryUser event, Emitter<PrimaryRegisterState> emit) async {
    emit(PrimaryRegisterLoading());
    final Either<Failure, CommonResponse> result = await registerUseCase.callAddPrimaryUser(event.dataMap);

    result.fold(
          (failure) => emit(PrimaryRegisterError(failure.message)),
          (response) => emit(AddPrimaryUserApiSuccess(response)),
    );
  }


  void _onFetchPendingProfile(LoadPendingProfile event, Emitter<PrimaryRegisterState> emit,) async {
    emit(PrimaryRegisterLoading());

    final Either<Failure, ViewPendingProfileResponse> result = await registerUseCase.getViewPendingProfile();

    result.fold(
          (failure) => emit(PrimaryRegisterError(failure.message)),
          (response) => emit(PendingAccountSuccess(response)),
    );
  }

  void _onFetchCancelProfile(LoadCancelProfile event, Emitter<PrimaryRegisterState> emit,) async {
    emit(PrimaryRegisterLoading());

    final Either<Failure, CommonResponse> result = await registerUseCase.getCancelPendingProfile();

    result.fold(
          (failure) => emit(PrimaryRegisterError(failure.message)),
          (response) => emit(CancelPendingProfileSuccess(response)),
    );
  }

  void _onFetchReminderProfile(LoadReminderProfile event, Emitter<PrimaryRegisterState> emit,) async {
    emit(PrimaryRegisterLoading());

    final Either<Failure, CommonResponse> result = await registerUseCase.getReminderPendingProfile();

    result.fold(
          (failure) => emit(PrimaryRegisterError(failure.message)),
          (response) => emit(ReminderPendingProfileSuccess(response)),
    );
  }

  void _onFetchSociety(LoadSociety event, Emitter<PrimaryRegisterState> emit,) async {
    emit(PrimaryRegisterLoading());


    final Either<Failure, CommonResponse> result = await registerUseCase.getSociety();

    result.fold(
          (failure) => emit(PrimaryRegisterError(failure.message)),
          (response) => emit(SocietySuccess(response)),
    );
  }

}
