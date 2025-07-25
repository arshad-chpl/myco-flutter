import 'package:myco_flutter/features/my_profile/domain/entites/profile_entity.dart';

sealed class MyProfileState {
  const MyProfileState();

  @override
  List<Object?> get props => [];
}

final class InitialMyProfileState extends MyProfileState {}

class FetchProfileDataLoadingState extends MyProfileState {}

class FetchProfileDataSuccessState extends MyProfileState {
  final ProfileModelEntity profileEntity;

  const FetchProfileDataSuccessState(this.profileEntity);

  @override
  List<Object?> get props => [profileEntity];
}

class FetchProfileDataErrorState extends MyProfileState {
  final String errorMessage;

  const FetchProfileDataErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}