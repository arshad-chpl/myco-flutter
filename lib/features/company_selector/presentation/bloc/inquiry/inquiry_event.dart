import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/request_society_model.dart';

abstract class InquiryEvent extends Equatable {
  const InquiryEvent();
  @override
  List<Object?> get props => [];
}

class FormSubmitted extends InquiryEvent {
  final RequestSociety requestSociety;
  const FormSubmitted(this.requestSociety);

  @override
  List<Object?> get props => [requestSociety];
}
