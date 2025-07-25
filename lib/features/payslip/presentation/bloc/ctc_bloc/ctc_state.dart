//======== CTC Details State =========

import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/payslip/domain/entities/ctc_details_entity.dart';

sealed class CtcDetailsState extends Equatable {
  const CtcDetailsState();
  @override
  List<Object> get props => [];
}

final class CtcDetailsInitial extends CtcDetailsState {}

class GetCtcDetailsLoadingState extends CtcDetailsState {}

class GetCtcDetailsErrorState extends CtcDetailsState {
  final String error;
  const GetCtcDetailsErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

class GetCtcDetailsSuccessState extends CtcDetailsState {
  final CtcDetailsEntity ctcDetails;

  const GetCtcDetailsSuccessState({required this.ctcDetails});

  @override
  List<Object> get props => [ctcDetails];
}
