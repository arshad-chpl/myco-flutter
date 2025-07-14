part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class GetIDCardDetails extends DashboardEvent {
  final String? getIDCardDetails,userId, companyId, languageId;
  const GetIDCardDetails({
    this.getIDCardDetails = 'getIDCardDetails',
    this.userId,
    this.companyId,
    this.languageId,
  });
}
