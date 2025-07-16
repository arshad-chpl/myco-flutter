import 'package:myco_flutter/features/company_selector/data/models/request_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/verify_otp_request_model.dart';

abstract class LoginEvent {}

class SendOtpEvent extends LoginEvent {
  final RequestOtpRequestModel model;

  SendOtpEvent({required this.model});
}

class VerifyOtpEvent extends LoginEvent {
  final VerifyOtpRequestModel model;

  VerifyOtpEvent({required this.model});
}
