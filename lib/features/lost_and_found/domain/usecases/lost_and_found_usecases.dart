import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/lost_and_found/domain/entities/lost_and_found_entity.dart';
import 'package:myco_flutter/features/lost_and_found/domain/repositories/lost_and_found_repository.dart';

class GetLostAndFoundItemsUseCase {
  final LostAndFoundRepository repository;

  GetLostAndFoundItemsUseCase(this.repository);

  Future<Either<Failure, List<LostFoundEntity>>> call(
    Map<String, dynamic> request,
  ) {
    return repository.getLostAndFoundItems(request);
  }
}
