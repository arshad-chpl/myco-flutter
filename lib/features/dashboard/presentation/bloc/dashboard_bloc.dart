import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/home_menu_response_entity.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/my_unit_request_entity.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/my_unit_response_entity.dart';
import 'package:myco_flutter/features/dashboard/domain/usecases/dashboard_usecases.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardUsecases dashboardUsecases;
  DashboardBloc(this.dashboardUsecases) : super(DashboardInitial()) {
    on<GetIDCardDetails>(onGetIdCardDetail);
    on<GetAppMenuGridWithCategory>(getAppMenuGridWithCategory);
    on<GetMyUnits>(getMyUnits);
  }

  Future<void> onGetIdCardDetail(
    GetIDCardDetails event,
    Emitter<DashboardState> emit,
  ) async {
    Map<String, dynamic> dataMap = {
      'getIDCardDetails': event.getIDCardDetails,
      'user_id': event.userId,
      'society_id': event.companyId,
      'language_id': event.languageId,
    };
    var result = await dashboardUsecases.getIDCardDetails(dataMap);
    result.fold(
      (failure) => emit(DashboardError(failure.message)),
      (res) => emit(IdCardDetailLoaded('')),
    );
  }

  Future<void> getAppMenuGridWithCategory(
    GetAppMenuGridWithCategory event,
    Emitter<DashboardState> emit,
  ) async {
    if (state is! DashboardLoaded) {
      emit(const DashboardLoaded());
    }
    Map<String, dynamic> dataMap = {
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

    // var result = await dashboardUsecases.getAppMenuGridWithCategory(dataMap);
    // result.fold((failure)=>emit(DashboardError(failure.message)), (res)=>emit(AppMenuGridLoaded(res)));

    var result = await dashboardUsecases.getAppMenuGridWithCategory(dataMap);
    result.fold((failure) => emit(DashboardError(failure.message)), (res) {
      final currentState = state as DashboardLoaded;
      emit(currentState.copyWith(homeMenuData: res));
    });
  }

  Future<void> getMyUnits(
    GetMyUnits event,
    Emitter<DashboardState> emit,
  ) async {
    if (state is! DashboardLoaded) {
      emit(const DashboardLoaded());
    }
    // var result = await dashboardUsecases.getMyUnits(event.request.toJson());
    // result.fold((failure)=>emit(DashboardError(failure.message)), (res)=>emit(MyUnitsLoaded(res)));

    var result = await dashboardUsecases.getMyUnits(event.request.toJson());
    result.fold((failure) => emit(DashboardError(failure.message)), (res) {
      final currentState = state as DashboardLoaded;
      emit(currentState.copyWith(myUnitData: res));
    });
  }
}
