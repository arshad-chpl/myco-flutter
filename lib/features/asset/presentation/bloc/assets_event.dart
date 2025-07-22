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

/// Dispatched on initial load (fetches everything in background, tab 0 active)
class InitializeAssetsEvent extends AssetsEvent {
  const InitializeAssetsEvent();
}

/// Dispatched when user taps a tab (updates selected tab and uses cached data if possible)
class TabChanged extends AssetsEvent {
  final int index;

  const TabChanged(this.index);

  @override
  List<Object?> get props => [index];
}

/// Dispatched when user performs a search on asset list
class SearchAssetsEvent extends AssetsEvent {
  final String query;

  const SearchAssetsEvent(this.query);

  @override
  List<Object?> get props => [query];
}
