class AssetsTabState {
  final int selectedIndex;
  AssetsTabState({required this.selectedIndex});
}

class AssetsFilterState {
  final String category;
  final String brand;

  AssetsFilterState({required this.category, required this.brand});
}
