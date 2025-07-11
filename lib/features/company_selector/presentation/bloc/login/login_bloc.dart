import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/request_otp_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RequestOtpRepository requestOtpRepository;
  // If you have a verifyOTP use case, inject it similarly

  LoginBloc({required this.requestOtpRepository}) : super(LoginInitial()) {
    on<SendOtpEvent>(_onSendOtp);
    on<VerifyOtpEvent>(_onVerifyOtp);
  }

  Future<void> _onSendOtp(SendOtpEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final Either<Failure, CommonResponse> result =
    await requestOtpRepository.requestOtp(); // adjust params if needed

    result.fold(
          (failure) => emit(LoginError(failure.message)),
          (response) => emit(OtpSentState()),
    );
  }

  Future<void> _onVerifyOtp(VerifyOtpEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    // TODO: integrate VerifyOtp use case
    // final Either<Failure, CommonResponse> result =
    //     await verifyOtpRepository.verifyOtp(event.contactInfo, event.otp);
    //
    // For now, simulate success:
    await Future.delayed(Duration(seconds: 1));
    emit(OtpVerifiedState());
  }
}
