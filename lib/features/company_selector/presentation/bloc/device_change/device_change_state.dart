import 'package:myco_flutter/core/models/data/common_response_model.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';

abstract class DeviceChangeState {}

class DeviceChangeInitial extends DeviceChangeState {}

class DeviceChangeLoading extends DeviceChangeState {}

class DeviceChangeSuccess extends DeviceChangeState {
  final CommonResponseModelEntity response;
  DeviceChangeSuccess(this.response);
}

class DeviceChangeFailure extends DeviceChangeState {
  final String response;
  DeviceChangeFailure(this.response);
}
