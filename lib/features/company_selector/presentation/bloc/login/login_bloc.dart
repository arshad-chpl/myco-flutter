import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/company_selector/data/models/verify_otp_reponse.dart';
import 'package:myco_flutter/features/company_selector/domain/usecases/request_otp.dart';
import 'package:myco_flutter/features/company_selector/domain/usecases/verify_otp.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/login/login_event.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RequestOtp requestOtp;
  final VerifyOtp verifyOtp;

  LoginBloc({required this.requestOtp, required this.verifyOtp})
    : super(LoginInitial()) {
    on<SendOtpEvent>(_onSendOtp);
    on<VerifyOtpEvent>(_onVerifyOtp);
  }

  Future<void> _onSendOtp(SendOtpEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final Either<Failure, CommonResponse> result = await requestOtp(
      event.model,
    );

    result.fold((failure) => emit(LoginError(failure.message)), (response) {
      if (response.error == null) {
        emit(OtpSentState(response));
      } else {
        emit(OtpNotSentState(response));
      }
    });
  }

  Future<void> _onVerifyOtp(
    VerifyOtpEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    final Either<Failure, VerifyOtpResponse> result = await verifyOtp(
      event.model,
    );

    result.fold((failure) => emit(LoginError(failure.message)), (response) {
      if (response.error == null) {
        emit(OtpVerifiedState(response));
      } else {
        emit(OtpVerificationFailedState(response));
      }
    });
  }
}
