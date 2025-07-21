import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/asset/domain/entities/asset_entity.dart';
import 'package:myco_flutter/features/asset/domain/usecases/asset_usecases.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/assets_event.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/assets_state.dart';

class AssetsFilterBloc extends Bloc<AssetsFilterEvent, AssetsFilterState> {
  AssetsFilterBloc()
    : super(
        AssetsFilterState(category: 'All Categories', brand: 'All Brands'),
      ) {
    on<AssetsFilters>((event, emit) {
      emit(
        AssetsFilterState(
          category: event.category ?? state.category,
          brand: event.brand ?? state.brand,
        ),
      );
    });
  }
}

// class AssetsBloc extends Bloc<AssetsEvent, AssetsState> {
//   final AssetsUseCases useCases;

//   AssetsBloc(this.useCases) : super(const AssetsInitial()) {
//     on<TabChanged>(_onTabChanged);

//     // Optionally trigger tab 0 on init
//     add(TabChanged(0));
//   }

//   Future<void> _onTabChanged(
//     TabChanged event,
//     Emitter<AssetsState> emit,
//   ) async {
//     emit(AssetsLoading(selectedIndex: event.index));

//     final oldItems = _mapIndexToOldItems(event.index);

//     if (oldItems == '2') {
//       // Don't call API for "All" tab — skip if needed
//       return;
//     }

//     final dataMap = {
//       'getAssetsNew': 'getAssetsNew',
//       'society_id': '1',
//       'unit_id': '1718',
//       'user_id': '1679',
//       'language_id': '1',
//       'floor_id': '1',
//       'old_items': oldItems,
//     };

//     final result = await useCases.getAssets(dataMap);

//     result.fold(
//       (failure) => emit(
//         AssetsError(message: failure.message, selectedIndex: event.index),
//       ),
//       (entity) =>
//           emit(AssetsLoaded(assets: entity, selectedIndex: event.index)),
//     );
//   }

//   String? _mapIndexToOldItems(int index) {
//     switch (index) {
//       case 0:
//         return '0'; // Active
//       case 1:
//         return '1'; // Past
//       default:
//         return '2'; // All tab — may not need API
//     }
//   }
// }

class AssetsBloc extends Bloc<AssetsEvent, AssetsState> {
  final AssetsUseCases useCases;

  AssetsEntity? _allAssetsEntity;

  AssetsBloc(this.useCases) : super(const AssetsInitial()) {
    on<TabChanged>(_onTabChanged);
    on<SearchAssetsEvent>(_onSearch);
    add(const TabChanged(0)); // Default tab
  }

  Future<void> _onTabChanged(
    TabChanged event,
    Emitter<AssetsState> emit,
  ) async {
    emit(AssetsLoading(selectedIndex: event.index));

    final oldItems = _mapIndexToOldItems(event.index);

    if (oldItems == '2') {
      // All tab — no API call, show cached or empty
      emit(
        AssetsLoaded(
          assets: _allAssetsEntity?.assets ?? [],
          originalAssets: _allAssetsEntity?.assets ?? [],
          selectedIndex: event.index,
        ),
      );
      return;
    }

    final dataMap = {
      'getAssetsNew': 'getAssetsNew',
      'society_id': '1',
      'unit_id': '1718',
      'user_id': '1679',
      'language_id': '1',
      'floor_id': '1',
      'old_items': oldItems,
    };

    final result = await useCases.getAssets(dataMap);

    result.fold(
      (failure) => emit(
        AssetsError(message: failure.message, selectedIndex: event.index),
      ),
      (entity) {
        _allAssetsEntity = entity;
        emit(
          AssetsLoaded(
            assets: entity.assets ?? [],
            originalAssets: entity.assets ?? [],
            selectedIndex: event.index,
          ),
        );
      },
    );
  }

  void _onSearch(SearchAssetsEvent event, Emitter<AssetsState> emit) {
    final currentState = state;
    if (currentState is AssetsLoaded) {
      final query = event.query.toLowerCase().trim();

      final filtered = currentState.originalAssets.where((asset) {
        final name = asset.assetsName?.toLowerCase() ?? '';
        final brand = asset.assetsBrandName?.toLowerCase() ?? '';
        final category = asset.assetsCategory?.toLowerCase() ?? '';
        return name.contains(query) ||
            brand.contains(query) ||
            category.contains(query);
      }).toList();

      emit(
        AssetsLoaded(
          assets: filtered,
          originalAssets: currentState.originalAssets,
          selectedIndex: currentState.selectedIndex,
        ),
      );
    }
  }

  String _mapIndexToOldItems(int index) {
    switch (index) {
      case 0:
        return '0'; // Active
      case 1:
        return '1'; // Past
      default:
        return '2'; // All
    }
  }
}
