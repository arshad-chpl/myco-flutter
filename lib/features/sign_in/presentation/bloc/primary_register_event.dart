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

  final String blockId;
  final String userFirstName;
  final String userLastName;
  final String userFullName;
  final String areaName;
  final String blockName;

  const LoadReminderProfile(
  this.blockId,
  this.userFirstName,
  this.userLastName,
  this.userFullName,
  this.areaName,
  this.blockName,
  );

  @override
  List<Object> get props => [blockId,userFirstName,userLastName,userFullName,areaName,blockName];
}

class LoadSociety extends PrimaryRegisterEvent {}
