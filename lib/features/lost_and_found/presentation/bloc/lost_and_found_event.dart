import 'package:equatable/equatable.dart';

abstract class LostAndFoundEvent extends Equatable {
  const LostAndFoundEvent();

  @override
  List<Object?> get props => [];
}

class GetLostAndFoundItemsEvent extends LostAndFoundEvent {
  final Map<String, dynamic> request;

  const GetLostAndFoundItemsEvent(this.request);

  @override
  List<Object?> get props => [request];
}
