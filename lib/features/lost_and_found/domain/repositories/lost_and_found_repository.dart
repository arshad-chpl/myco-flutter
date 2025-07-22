import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/lost_and_found/domain/entities/lost_and_found_entity.dart';

/// Repository for Lost & Found business logic
abstract class LostAndFoundRepository {
  /// Fetches Lost & Found items
  Future<Either<Failure, List<LostFoundEntity>>> getLostAndFoundItems(
    Map<String, dynamic> request,
  );
}
