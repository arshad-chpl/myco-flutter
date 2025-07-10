import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/admin_view/data/models/admin_view_request.dart';
import 'package:myco_flutter/features/admin_view/domain/entities/admin_view_entity.dart';
import 'package:myco_flutter/features/admin_view/domain/repositories/admin_view_repository.dart';

class GetAdminViewUseCase {
  final AdminViewRepository repository;

  GetAdminViewUseCase({required this.repository});

  Future<Either<Failure, AdminViewResponseEntity>> call(
    GetAdminViewParams params,
  ) async {
    final request = AdminViewRequest(
      tag: params.tag,
      companyId: params.companyId,
      userId: params.userId,
      languageId: params.languageId,
      isDashboard: params.isDashboard,
      accessTypeId: params.accessTypeId,
      shouldCache: params.shouldCache,
    );
    return await repository.getAdminView(request);
  }
}

class GetAdminViewParams extends Equatable {
  final String tag;
  final String companyId;
  final String userId;
  final String languageId;
  final bool isDashboard;
  final String? accessTypeId;
  final bool shouldCache;

  const GetAdminViewParams({
    required this.tag,
    required this.companyId,
    required this.userId,
    required this.languageId,
    required this.isDashboard,
    required this.shouldCache,
    this.accessTypeId,
  });

  @override
  List<Object?> get props => [
    tag,
    companyId,
    userId,
    languageId,
    isDashboard,
    accessTypeId,
    shouldCache,
  ];
}
