import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/payslip/domain/usecases/get_ctc_details.dart';
import 'package:myco_flutter/features/payslip/presentation/bloc/ctc_bloc/ctc_event.dart';
import 'package:myco_flutter/features/payslip/presentation/bloc/ctc_bloc/ctc_state.dart';

class CtcDetailsBloc extends Bloc<CtcDetailsEvent, CtcDetailsState> {
  final GetCtcDetails getCtcDetails;

  CtcDetailsBloc(this.getCtcDetails) : super(CtcDetailsInitial()) {
    on<GetCtcDetailsEvent>(getCtcDetail);
  }

  FutureOr<void> getCtcDetail(
    GetCtcDetailsEvent event,
    Emitter<CtcDetailsState> emit,
  ) async {
    emit(GetCtcDetailsLoadingState());

    final result = await getCtcDetails();

    result.fold(
      (failure) => emit(GetCtcDetailsErrorState(error: failure.message)),
      (response) => emit(GetCtcDetailsSuccessState(ctcDetails: response)),
    );
  }
}
