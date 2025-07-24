import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_device_change_model.dart';

abstract class DeviceChangeEvent extends Equatable {
  const DeviceChangeEvent();

  @override
  List<Object?> get props => [];
}

class SubmitDeviceChangeRequest extends DeviceChangeEvent {
  final RequestDeviceChangeModel model;

  const SubmitDeviceChangeRequest(this.model);

  @override
  List<Object?> get props => [model];
}
