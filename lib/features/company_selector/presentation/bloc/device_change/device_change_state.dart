import 'package:myco_flutter/core/models/common_response.dart';

abstract class DeviceChangeState {}

class DeviceChangeInitial extends DeviceChangeState {}

class DeviceChangeLoading extends DeviceChangeState {}

class DeviceChangeSuccess extends DeviceChangeState {
  final CommonResponse response;
  DeviceChangeSuccess(this.response);
}

class DeviceChangeFailure extends DeviceChangeState {
  final String response;
  DeviceChangeFailure(this.response);
}
