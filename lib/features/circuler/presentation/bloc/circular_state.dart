part of 'circular_bloc.dart';

abstract class CircularState extends Equatable {
  const CircularState();

  @override
  List<Object> get props => [];
}

class CircularInitial extends CircularState {}

class CircularApiLoading extends CircularState {}


// block api success
class NoticeFilterApiSuccess extends CircularState {
  final NoticeBoardResponseEntity imgPdfList;
  const NoticeFilterApiSuccess(this.imgPdfList);

  @override
  List<Object> get props => [imgPdfList];
}


class CircularApiError extends CircularState {
  final String message;
  const CircularApiError(this.message);

  @override
  List<Object> get props => [message];
}