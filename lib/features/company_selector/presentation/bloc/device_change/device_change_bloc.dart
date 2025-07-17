import 'package:bloc/bloc.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/company_selector/domain/usecases/request_device_change.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/device_change/device_change_event.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/device_change/device_change_state.dart';

class DeviceChangeBloc extends Bloc<DeviceChangeEvent, DeviceChangeState> {
  final RequestDeviceChange requestDeviceChange;

  DeviceChangeBloc({required this.requestDeviceChange}) : super(DeviceChangeInitial()) {
    on<SubmitDeviceChangeRequest>(_onSubmitDeviceChangeRequest);
  }

  Future<void> _onSubmitDeviceChangeRequest(
      SubmitDeviceChangeRequest event,
      Emitter<DeviceChangeState> emit,
      ) async {
    emit(DeviceChangeLoading());

    final result = await requestDeviceChange(event.model);

    result.fold(
          (Failure failure) {
        emit(DeviceChangeFailure(failure.message));
      },
          (success) {
        emit(DeviceChangeSuccess(success));
      },
    );
  }
}
