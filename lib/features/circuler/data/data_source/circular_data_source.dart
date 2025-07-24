import 'package:myco_flutter/features/circuler/data/models/notice_board_response.dart';

abstract class CircularDataSource {

  Future<NoticeBoardResponse> getNoticeFilter();

}
