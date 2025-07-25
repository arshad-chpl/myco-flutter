//======== CTC Details =========

import 'package:equatable/equatable.dart';

sealed class CtcDetailsEvent extends Equatable {
  const CtcDetailsEvent();
  @override
  List<Object> get props => [];
}

class GetCtcDetailsEvent extends CtcDetailsEvent {}
