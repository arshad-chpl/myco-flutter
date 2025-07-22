import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/company_selector/domain/entites/verify_otp_response_entity.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class OtpSentState extends LoginState {
  final CommonResponseModelEntity response;
  OtpSentState(this.response);
}

class OtpNotSentState extends LoginState {
  final CommonResponseModelEntity response;
  OtpNotSentState(this.response);
}

class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
}

class OtpVerifiedState extends LoginState {
  final VerifyOtpResponseEntity response;
  OtpVerifiedState(this.response);
}

class OtpVerificationFailedState extends LoginState {
  final VerifyOtpResponseEntity response;
  OtpVerificationFailedState(this.response);
}
