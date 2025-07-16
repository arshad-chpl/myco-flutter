import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/company_info/model/company_info_response.dart';

abstract class CompanyInfoState extends Equatable {
  const CompanyInfoState();

  @override
  List<Object?> get props => [];
}

class CompanyInfoInitial extends CompanyInfoState {}

class CompanyInfoLoading extends CompanyInfoState {}

class CompanyInfoLoaded extends CompanyInfoState {
  final CompanyInfoResponse companyInfo;

  const CompanyInfoLoaded(this.companyInfo);

  @override
  List<Object?> get props => [companyInfo];
}

class CompanyInfoError extends CompanyInfoState {
  final String message;

  const CompanyInfoError(this.message);

  @override
  List<Object?> get props => [message];
}
