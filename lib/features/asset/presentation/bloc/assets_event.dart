import 'package:equatable/equatable.dart';

abstract class AssetsTabEvent {}
abstract class AssetsFilterEvent {}

class TabChanged extends AssetsTabEvent {
  final int index;
  TabChanged(this.index);
}

class AssetsFilters extends AssetsFilterEvent {
  final String? category;
  final String? brand;
  AssetsFilters({this.category, this.brand});
}


abstract class AssetsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchAssetsEvent extends AssetsEvent {
  final String oldItems; // "0" for active, "1" for past

  FetchAssetsEvent({required this.oldItems});

  @override
  List<Object?> get props => [oldItems];
}
