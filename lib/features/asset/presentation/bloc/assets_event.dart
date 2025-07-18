import 'package:equatable/equatable.dart';

abstract class AssetsFilterEvent {}

class AssetsFilters extends AssetsFilterEvent {
  final String? category;
  final String? brand;
  AssetsFilters({this.category, this.brand});
}

abstract class AssetsEvent extends Equatable {
  const AssetsEvent();

  @override
  List<Object?> get props => [];
}

class TabChanged extends AssetsEvent {
  final int index;

  const TabChanged(this.index);

  @override
  List<Object?> get props => [index];
}

class SearchAssetsEvent extends AssetsEvent {
  final String query;

  const SearchAssetsEvent(this.query);

  @override
  List<Object?> get props => [query];
}
