part of 'primary_register_bloc.dart';

abstract class PrimaryRegisterState extends Equatable {
  const PrimaryRegisterState();

  @override
  List<Object> get props => [];
}

class PrimaryRegisterInitial extends PrimaryRegisterState {}

class PrimaryRegisterLoading extends PrimaryRegisterState {}

class AddPrimaryUserApiSuccess extends PrimaryRegisterState {
  final CommonResponseModelEntity response;
  const AddPrimaryUserApiSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class PendingAccountSuccess extends PrimaryRegisterState {
  final ViewPendingProfileEntity response;
  const PendingAccountSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class ReminderPendingProfileSuccess extends PrimaryRegisterState {
  final CommonResponseModelEntity response;
  const ReminderPendingProfileSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class SocietySuccess extends PrimaryRegisterState {
  final CommonResponseModelEntity response;
  const SocietySuccess(this.response);

  @override
  List<Object> get props => [response];
}

class CancelPendingProfileSuccess extends PrimaryRegisterState {
  final CommonResponseModelEntity response;
  const CancelPendingProfileSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class PrimaryRegisterError extends PrimaryRegisterState {
  final String message;
  const PrimaryRegisterError(this.message);

  @override
  List<Object> get props => [message];
}