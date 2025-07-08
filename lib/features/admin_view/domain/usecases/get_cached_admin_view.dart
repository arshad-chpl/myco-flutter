import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/admin_view/domain/entities/admin_view_entity.dart';
import 'package:myco_flutter/features/admin_view/domain/repositories/admin_view_repository.dart';

class GetCachedAdminViewUseCase {
  final AdminViewRepository repository;

  GetCachedAdminViewUseCase({required this.repository});

  Future<Either<Failure, AdminViewResponseEntity>> call(
    String companyId,
  ) async => await repository.getCachedAdminView(companyId);
}
