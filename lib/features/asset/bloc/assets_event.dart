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
