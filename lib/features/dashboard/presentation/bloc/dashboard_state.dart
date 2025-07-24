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
