
import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/circuler/domain/entity/notice_board_response_entity.dart';
import 'package:myco_flutter/features/circuler/domain/repositories/circular_repository.dart';

class CircularUseCase {
  final CircularRepository repository;

  CircularUseCase({required this.repository});

  Future<Either<Failure, NoticeBoardResponseEntity>> callNoticeFilter() async => await repository.getNoticeFilter();

}