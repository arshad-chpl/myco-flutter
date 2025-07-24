part of 'dashboard_bloc.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

final class DashboardInitial extends DashboardState {}

final class DashboardError extends DashboardState {
  final String message;

  const DashboardError(this.message);

  @override
  List<Object> get props => [message];
}

final class IdCardDetailLoaded extends DashboardState {
  final String message;

  const IdCardDetailLoaded(this.message);

  @override
  List<Object> get props => [message];
}

final class AppMenuGridLoaded extends DashboardState {
  final HomeMenuResponseEntity res;

  const AppMenuGridLoaded(this.res);

  @override
  List<Object> get props => [res];
}

final class MyUnitsLoaded extends DashboardState {
  final MyUnitResponseEntity res;

  const MyUnitsLoaded(this.res);

  @override
  List<Object> get props => [res];
}

// A single state to hold all loaded data
final class DashboardLoaded extends DashboardState {
  final HomeMenuResponseEntity? homeMenuData;
  final MyUnitResponseEntity? myUnitData;

  const DashboardLoaded({this.homeMenuData, this.myUnitData});

  // copyWith allows updating parts of the state without losing the rest
  DashboardLoaded copyWith({
    HomeMenuResponseEntity? homeMenuData,
    MyUnitResponseEntity? myUnitData,
  }) {
    return DashboardLoaded(
      homeMenuData: homeMenuData ?? this.homeMenuData,
      myUnitData: myUnitData ?? this.myUnitData,
    );
  }

  @override
  List<Object> get props => [homeMenuData ?? [], myUnitData ?? []];
}
