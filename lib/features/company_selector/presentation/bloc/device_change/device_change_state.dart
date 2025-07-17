import 'package:equatable/equatable.dart';
import 'package:myco_flutter/core/models/common_response.dart';

abstract class DeviceChangeState extends Equatable {
  const DeviceChangeState();

  @override
  List<Object?> get props => [];
}

class DeviceChangeInitial extends DeviceChangeState {}

class DeviceChangeLoading extends DeviceChangeState {}

class DeviceChangeSuccess extends DeviceChangeState {
  final CommonResponse response;

  const DeviceChangeSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class DeviceChangeFailure extends DeviceChangeState {
  final String message;

  const DeviceChangeFailure(this.message);

  @override
  List<Object?> get props => [message];
}
