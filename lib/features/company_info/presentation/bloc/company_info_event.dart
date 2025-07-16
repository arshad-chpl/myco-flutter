import 'package:equatable/equatable.dart';

abstract class CompanyInfoEvent extends Equatable {
  const CompanyInfoEvent();

  @override
  List<Object> get props => [];
}

class FetchCompanyInfo extends CompanyInfoEvent {}
