import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/lost_and_found/domain/entities/lost_and_found_entity.dart';

abstract class LostAndFoundState extends Equatable {
  const LostAndFoundState();

  @override
  List<Object?> get props => [];
}

class LostAndFoundInitial extends LostAndFoundState {}

class LostAndFoundLoading extends LostAndFoundState {}

class LostAndFoundLoaded extends LostAndFoundState {
  final List<LostFoundEntity> items;

  const LostAndFoundLoaded(this.items);

  @override
  List<Object?> get props => [items];
}

class LostAndFoundError extends LostAndFoundState {
  final String message;

  const LostAndFoundError(this.message);

  @override
  List<Object?> get props => [message];
}
