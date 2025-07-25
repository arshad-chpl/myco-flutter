part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class GetIDCardDetails extends DashboardEvent {
  final String? getIDCardDetails, userId, companyId, languageId;
  const GetIDCardDetails({
    this.getIDCardDetails = 'getIDCardDetails',
    this.userId,
    this.companyId,
    this.languageId,
  });
}

class GetAppMenuGridWithCategory extends DashboardEvent {
  final String? getAppMenuGridWithCat,
      userId,
      companyId,
      languageId,
      society_id,
      unit_id,
      country_id,
      state_id,
      city_id,
      device,
      language_id;
  const GetAppMenuGridWithCategory({
    this.getAppMenuGridWithCat = 'getAppMenuGridWithCategory',
    this.society_id,
    this.unit_id,
    this.country_id,
    this.state_id,
    this.city_id,
    this.device,
    this.language_id,
    this.userId,
    this.companyId,
    this.languageId,
  });
}

class GetMyUnits extends DashboardEvent {
  final GetMyUnitsRequest request;
  const GetMyUnits({required this.request});
}
