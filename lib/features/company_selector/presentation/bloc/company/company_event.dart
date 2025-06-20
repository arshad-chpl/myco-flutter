import 'package:equatable/equatable.dart';

abstract class CompanyEvent extends Equatable {
  const CompanyEvent();
  @override
  List<Object> get props => [];
}

class SearchCompany extends CompanyEvent {
  final String query;
  const SearchCompany(this.query);
}

class InitialView extends CompanyEvent {}