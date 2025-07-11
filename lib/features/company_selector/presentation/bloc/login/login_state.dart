abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class OtpSentState extends LoginState {}

class OtpVerifiedState extends LoginState {}

class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
}
