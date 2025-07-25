part of 'primary_register_bloc.dart';

abstract class PrimaryRegisterEvent extends Equatable {
  const PrimaryRegisterEvent();

  @override
  List<Object> get props => [];
}


class LoadAddPrimaryUser extends PrimaryRegisterEvent {
  final Map<String, dynamic> dataMap;

  const LoadAddPrimaryUser(this.dataMap);

  @override
  List<Object> get props => [dataMap];
}



//pending profile
class LoadPendingProfile extends PrimaryRegisterEvent {}
class LoadCancelProfile extends PrimaryRegisterEvent {}

class LoadReminderProfile extends PrimaryRegisterEvent {
  final Map<String, dynamic> dataMap;

  const LoadReminderProfile(this.dataMap);

  @override
  List<Object> get props => [dataMap];
}

class LoadSociety extends PrimaryRegisterEvent {

  final String societyId;

  const LoadSociety(this.societyId);

  @override
  List<Object> get props => [societyId];
}
