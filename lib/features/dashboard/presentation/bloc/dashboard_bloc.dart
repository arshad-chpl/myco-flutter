import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/home_menu_entity.dart';
import 'package:myco_flutter/features/dashboard/domain/usecases/dashboard_usecases.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardUsecases dashboardUsecases;
  DashboardBloc(this.dashboardUsecases) : super(DashboardInitial()) {
    on<GetIDCardDetails>(onGetIdCardDetail);
    on<GetAppMenuGridWithCategory>(getAppMenuGridWithCategory);
  }

  Future<void> onGetIdCardDetail(
    GetIDCardDetails event,
    Emitter<DashboardState> emit,
  ) async {
    Map<String,dynamic> dataMap = {
      'getIDCardDetails': event.getIDCardDetails,
      'user_id': event.userId,
      'society_id': event.companyId,
      'language_id': event.languageId,
    };
    var result = await dashboardUsecases.getIDCardDetails(dataMap);
    result.fold((failure)=>emit(DashboardError(failure.message)), (res)=>emit(IdCardDetailLoaded('')));
  }

  Future<void> getAppMenuGridWithCategory(
    GetAppMenuGridWithCategory event,
    Emitter<DashboardState> emit,
  )async{
    Map<String,dynamic> dataMap = {
      'getAppMenuGridWithCategory': event.getAppMenuGridWithCat,
      'user_id': event.userId,
      'company_id': event.companyId,
      'language_id': event.languageId,
      'society_id': event.society_id,
      'unit_id': event.unit_id,
      'country_id': event.country_id,
      'state_id': event.state_id,
      'city_id': event.city_id,
      'device': event.device,
    };
    var result = await dashboardUsecases.getAppMenuGridWithCategory(dataMap);
    result.fold((failure)=>emit(DashboardError(failure.message)), (res)=>emit(AppMenuGridLoaded(res)));
  }
}
