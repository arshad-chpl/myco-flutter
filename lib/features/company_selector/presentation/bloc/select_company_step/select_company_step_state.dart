part of 'select_company_step_bloc.dart';

abstract class SelectCompanyStepState extends Equatable {
  const SelectCompanyStepState();

  @override
  List<Object?> get props => [];
}

/// Initial state: show company search UI.
class SelectCompanyStepInitial extends SelectCompanyStepState {}

/// State for the Login UI.
class SelectCompanyStepLogin extends SelectCompanyStepState {
  final SocietyEntity selectedCompany;

  const SelectCompanyStepLogin(this.selectedCompany);

  @override
  List<Object?> get props => [selectedCompany];
}

/// State for the OTP Verification UI.
class SelectCompanyStepOtp extends SelectCompanyStepState {
  final CommonResponseModelEntity otpResponse;
  final SocietyEntity selectedCompany;
  final String contactValue;
  final String countryCode;

  const SelectCompanyStepOtp({
    required this.otpResponse,
    required this.selectedCompany,
    required this.contactValue,
    required this.countryCode,
  });

  @override
  List<Object?> get props => [otpResponse, selectedCompany, contactValue, countryCode];
}
