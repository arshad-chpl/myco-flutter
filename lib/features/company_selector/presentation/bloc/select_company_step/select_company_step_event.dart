part of 'select_company_step_bloc.dart';

abstract class SelectCompanyStepEvent extends Equatable {
  const SelectCompanyStepEvent();

  @override
  List<Object?> get props => [];
}

/// Event to navigate to the login step after a company is selected.
class GoToLoginStep extends SelectCompanyStepEvent {
  final SocietyEntity selectedCompany;

  const GoToLoginStep(this.selectedCompany);

  @override
  List<Object?> get props => [selectedCompany];
}

/// Event to navigate to the OTP verification step.
class GoToOtpStep extends SelectCompanyStepEvent {
  final CommonResponseModelEntity otpResponse;
  final SocietyEntity selectedCompany;
  final String contactValue; // email or phone
  final String countryCode;

  const GoToOtpStep({
    required this.otpResponse,
    required this.selectedCompany,
    required this.contactValue,
    required this.countryCode,
  });

  @override
  List<Object?> get props => [otpResponse, selectedCompany, contactValue, countryCode];
}

/// Event to go back to the previous step.
class GoToPreviousStep extends SelectCompanyStepEvent {}

/// Event to reset the flow to the initial company selection.
class ResetToInitialStep extends SelectCompanyStepEvent {}
