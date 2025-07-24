import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:myco_flutter/features/my_profile/domain/usecases/get_profile_data.dart';
import 'package:myco_flutter/features/my_profile/presentation/bloc/my_profile_event.dart';
import 'package:myco_flutter/features/my_profile/presentation/bloc/my_profile_state.dart';


class MyProfileBloc extends Bloc<MyProfileEvent , MyProfileState> {
  final GetProfileData getProfileData;
  MyProfileBloc(this.getProfileData) : super(InitialMyProfileState()) {
    on<FetchProfileDataEvent>(fetchProfileData);
  }

  FutureOr<void> fetchProfileData(FetchProfileDataEvent event , Emitter<MyProfileState> emit) async{
    emit(FetchProfileDataLoadingState());

    final result = await getProfileData();

    result.fold(
      (failure) => emit(FetchProfileDataErrorState(failure.message)),
      (profileEntity) => emit(FetchProfileDataSuccessState(profileEntity)),
    );
}
}