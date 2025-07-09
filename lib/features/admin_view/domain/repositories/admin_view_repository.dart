import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/admin_view/data/models/admin_view_request.dart';
import 'package:myco_flutter/features/admin_view/domain/entities/admin_view_entity.dart';

abstract class AdminViewRepository {
  /// Fetches fresh data from remote and conditionally caches it.
  Future<Either<Failure, AdminViewResponseEntity>> getAdminView(
    AdminViewRequest request,
  );

  /// Gets data from the local cache.
  Future<Either<Failure, AdminViewResponseEntity>> getCachedAdminView(
    String companyId,
  );
}
