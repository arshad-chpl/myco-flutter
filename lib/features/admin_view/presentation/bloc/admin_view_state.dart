part of 'admin_view_bloc.dart';

abstract class AdminViewState extends Equatable {
  const AdminViewState();

  @override
  List<Object?> get props => [];
}

class AdminViewInitial extends AdminViewState {}

class AdminViewLoading extends AdminViewState {}

class AdminViewLoaded extends AdminViewState {
  final AdminViewResponseEntity adminViewData;

  const AdminViewLoaded({required this.adminViewData});

  @override
  List<Object> get props => [adminViewData];
}

class AdminViewError extends AdminViewState {
  final String message;

  const AdminViewError({required this.message});

  @override
  List<Object> get props => [message];
}
