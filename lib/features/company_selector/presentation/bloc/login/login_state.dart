import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/company_selector/data/models/verify_otp_reponse.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class OtpSentState extends LoginState {
  final CommonResponse response;
  OtpSentState(this.response);
}

class OtpNotSentState extends LoginState {
  final CommonResponse response;
  OtpNotSentState(this.response);
}

class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
}

class OtpVerifiedState extends LoginState {
  final VerifyOtpResponse response;
  OtpVerifiedState(this.response);
}

class OtpVerificationFailedState extends LoginState {
  final VerifyOtpResponse response;
  OtpVerificationFailedState(this.response);
}
