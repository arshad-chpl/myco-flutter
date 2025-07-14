import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/dashboard/domain/usecases/dashboard_usecases.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardUsecases dashboardUsecases;
  DashboardBloc(this.dashboardUsecases) : super(DashboardInitial()) {
    on<GetIDCardDetails>(onGetIdCardDetail);
  }

  Future<void> onGetIdCardDetail(
    GetIDCardDetails event,
    Emitter<DashboardState> emit,
  ) async {
    Map dataMap = {
      'getIDCardDetails': event.getIDCardDetails,
      'user_id': event.userId,
      'society_id': event.companyId,
      'language_id': event.languageId,
    };
    var result = await dashboardUsecases.getIDCardDetails(dataMap);
    result.fold((failure)=>emit(DashboardError(failure.message)), (res)=>emit(IdCardDetailLoaded('')));
  }
}
