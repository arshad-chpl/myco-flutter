part of 'admin_view_bloc.dart';

abstract class AdminViewEvent extends Equatable {
  const AdminViewEvent();

  @override
  List<Object?> get props => [];
}

class FetchAdminView extends AdminViewEvent {
  final String companyId;
  final String userId;
  final String languageId;

  const FetchAdminView({
    required this.companyId,
    required this.userId,
    required this.languageId,
  });

  @override
  List<Object> get props => [companyId, userId, languageId];
}
