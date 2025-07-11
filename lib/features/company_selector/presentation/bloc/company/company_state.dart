import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/company_selector/domain/entites/company_response.dart';

abstract class CompanyState extends Equatable {
  const CompanyState();
  @override
  List<Object> get props => [];
}

class CompanyInitial extends CompanyState {}

class CompanyLoading extends CompanyState {}

class CompanyLoaded extends CompanyState {
  final CompanyResponse companies;
  final int selectedIndex;

  const CompanyLoaded(this.companies, this.selectedIndex);
  @override
  List<Object> get props => [companies, selectedIndex];
}

class CompanyError extends CompanyState {
  final String message;
  const CompanyError(this.message);
  @override
  List<Object> get props => [message];
}
