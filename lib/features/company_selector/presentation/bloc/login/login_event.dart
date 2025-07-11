abstract class LoginEvent {}

class SendOtpEvent extends LoginEvent {
  final String contactInfo;
  final bool isEmail;
  SendOtpEvent({required this.contactInfo, required this.isEmail});
}

class VerifyOtpEvent extends LoginEvent {
  final String contactInfo;
  final String otp;
  VerifyOtpEvent({required this.contactInfo, required this.otp});
}
