import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/circuler/domain/entity/notice_board_response_entity.dart';
import 'package:myco_flutter/features/circuler/domain/usecase/circular_usecase.dart';

part 'circular_event.dart';
part 'circular_state.dart';

class CircularBloc extends Bloc<CircularEvent, CircularState> {
  final CircularUseCase registerUseCase;

  CircularBloc({required this.registerUseCase}) : super(CircularInitial()) {

    on<NoticeFilterList>(_onFetchNoticeFilterList);

  }


  void _onFetchNoticeFilterList(NoticeFilterList event, Emitter<CircularState> emit) async {
    emit(CircularApiLoading());
    final Either<Failure, NoticeBoardResponseEntity> result = await registerUseCase.callNoticeFilter();

    result.fold(
          (failure) => emit(CircularApiError(failure.message)),
          (response) => emit(NoticeFilterApiSuccess(response)),
    );
  }




}