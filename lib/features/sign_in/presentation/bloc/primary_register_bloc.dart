import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/features/sign_in/data/models/request/cancel_pending_profile_request.dart';
import 'package:myco_flutter/features/sign_in/data/models/request/reminder_pending_profile_Request.dart';
import 'package:myco_flutter/features/sign_in/data/models/request/society_list_request.dart';
import 'package:myco_flutter/features/sign_in/data/models/request/view_pending_profile_request.dart';
import 'package:myco_flutter/features/sign_in/domain/entities/view_pending_profile_entity.dart';
import 'package:myco_flutter/features/sign_in/domain/usecases/primary_register_usecase.dart';

part 'primary_register_event.dart';
part 'primary_register_state.dart';


class PrimaryRegisterBloc extends Bloc<PrimaryRegisterEvent, PrimaryRegisterState> {
  final PrimaryRegisterUseCase registerUseCase;


  final preferenceManager = GetIt.I<PreferenceManager>();

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
    final Either<Failure, CommonResponseModelEntity> result = await registerUseCase.callAddPrimaryUser(event.dataMap);

    result.fold(
          (failure) => emit(PrimaryRegisterError(failure.message)),
          (response) => emit(AddPrimaryUserApiSuccess(response)),
    );
  }


  void _onFetchPendingProfile(LoadPendingProfile event, Emitter<PrimaryRegisterState> emit) async {
    emit(PrimaryRegisterLoading());

    final String userId = await preferenceManager.getKeyValueString(VariableBag.registrationRequestPendingUserId);
    final String? companyId = await preferenceManager.getCompanyId();

    final request = ViewPendingProfileRequest(
        tag: 'ViewPendingProfile',
        userId: userId,
        companyId: companyId
    );

    final freshResult = await registerUseCase.getViewPendingProfile(request);

    freshResult.fold(
          (failure) => emit(PrimaryRegisterError(failure.message)),
          (response) => emit(PendingAccountSuccess(response)),
    );
  }

  void _onFetchCancelProfile(LoadCancelProfile event, Emitter<PrimaryRegisterState> emit) async {
    emit(PrimaryRegisterLoading());

    final String userId = await preferenceManager.getKeyValueString(VariableBag.registrationRequestPendingUserId);
    final String? companyId = await preferenceManager.getCompanyId();

    final request = CancelPendingProfileRequest(
        tag: 'CancelPendingProfile',
        userId: userId,
        companyId: companyId
    );

    final freshResult = await registerUseCase.getCancelPendingProfile(request);

    freshResult.fold(
          (failure) => emit(PrimaryRegisterError(failure.message)),
          (response) => emit(CancelPendingProfileSuccess(response)),
    );
  }

  void _onFetchReminderProfile(LoadReminderProfile event, Emitter<PrimaryRegisterState> emi,) async {
    emit(PrimaryRegisterLoading());

    final String userId = await preferenceManager.getKeyValueString(VariableBag.registrationRequestPendingUserId);
    final String? companyId = await preferenceManager.getCompanyId();

    final request = ReminderPendingProfileRequest(
        tag: 'ReminderPendingProfile',
        userId: userId,
        companyId: companyId,
        blockId: '',
        userFirstName: '',
        userLastName: '',
        userFullName: '',
        areaName: '',
        blockName: ''
    );

    final freshResult = await registerUseCase.getReminderPendingProfile(request);

    freshResult.fold(
          (failure) => emit(PrimaryRegisterError(failure.message)),
          (response) => emit(ReminderPendingProfileSuccess(response)),
    );
  }

  void _onFetchSociety(LoadSociety event, Emitter<PrimaryRegisterState> emit) async {
    emit(PrimaryRegisterLoading());

    final String? companyId = await preferenceManager.getCompanyId();

    final request = SocietyListRequest(
      tag: 'getSociety',
      countryId: '',
      companyId: companyId,
      stateId: '',
      cityId: '',
      companyName: '',
      languageId: '1'
    );

    final freshResult = await registerUseCase.getSociety(request);

    freshResult.fold(
          (failure) => emit(PrimaryRegisterError(failure.message)),
          (response) => emit(SocietySuccess(response)),
    );
  }

}
