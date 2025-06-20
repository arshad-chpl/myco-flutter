import 'package:equatable/equatable.dart';

abstract class InquiryState extends Equatable {
  const InquiryState();

  @override
  List<Object?> get props => [];
}

class InitialState extends InquiryState {}

class LoadingState extends InquiryState {}

class SuccessState extends InquiryState {
  final String message;
  const SuccessState({this.message = 'Inquiry submitted successfully'});
  @override
  List<Object?> get props => [message];
}

class ErrorState extends InquiryState {
  final String message;
  const ErrorState(this.message);

  @override
  List<Object?> get props => [message];
}