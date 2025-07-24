import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/circuler/domain/entity/notice_board_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/entities/Branch_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/entities/floor_and_unit_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/entities/shift_response_entity.dart';
import 'package:myco_flutter/features/common_api/domain/entities/uploaded_file_response_entity.dart';

abstract class CircularRepository {
  Future<Either<Failure, NoticeBoardResponseEntity>> getNoticeFilter();

}