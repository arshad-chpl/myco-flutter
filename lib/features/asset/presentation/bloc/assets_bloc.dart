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

class AssetsBloc extends Bloc<AssetsEvent, AssetsState> {
  final AssetsUseCases useCases;
  AssetsEntity? _activeAssetsEntity, _pastAssetsEntity, _allAssetsEntity;

  AssetsBloc(this.useCases) : super(const AssetsInitial()) {
    on<InitializeAssetsEvent>(_onInitialize);
    on<TabChanged>(_onTabChanged);
    on<SearchAssetsEvent>(_onSearch);
  }

  Future<void> _onInitialize(
    InitializeAssetsEvent event,
    Emitter<AssetsState> emit,
  ) async {
    emit(const AssetsLoading(selectedIndex: 0));
    final results = await Future.wait([
      _fetchAssetsData(0),
      _fetchAssetsData(1),
    ]);
    _activeAssetsEntity = results[0];
    _pastAssetsEntity = results[1];

    emit(
      AssetsLoaded(
        selectedIndex: 0,
        activeAssets: _activeAssetsEntity?.assets ?? [],
        pastAssets: _pastAssetsEntity?.assets ?? [],
        allAssets: _allAssetsEntity?.assets ?? [],
        currentAssets: _activeAssetsEntity?.assets ?? [],
      ),
    );
  }

  Future<void> _onTabChanged(
    TabChanged event,
    Emitter<AssetsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! AssetsLoaded) return;

    List<AssetEntity> newCurrentAssets;
    switch (event.index) {
      case 0:
        newCurrentAssets = currentState.activeAssets;
        break;
      case 1:
        newCurrentAssets = currentState.pastAssets;
        break;
      case 2:
        newCurrentAssets = currentState.allAssets;
        break;
      default:
        newCurrentAssets = [];
    }
    emit(
      currentState.copyWith(
        selectedIndex: event.index,
        currentAssets: newCurrentAssets,
      ),
    );

    // Optional: trigger fetch if empty
    // ...
  }

  void _onSearch(SearchAssetsEvent event, Emitter<AssetsState> emit) {
    final currentState = state;
    if (currentState is! AssetsLoaded) return;

    List<AssetEntity> baseList;
    switch (currentState.selectedIndex) {
      case 0:
        baseList = currentState.activeAssets;
        break;
      case 1:
        baseList = currentState.pastAssets;
        break;
      case 2:
        baseList = currentState.allAssets;
        break;
      default:
        baseList = [];
    }
    if (event.query.trim().isEmpty) {
      emit(currentState.copyWith(currentAssets: baseList));
    } else {
      final filtered = baseList.where((e) {
        final name = (e.assetsName ?? '').toLowerCase();
        final id = (e.assetsIdView ?? '').toLowerCase();
        final query = event.query.toLowerCase();
        return name.contains(query) || id.contains(query);
      }).toList();
      emit(currentState.copyWith(currentAssets: filtered));
    }
  }

  Future<AssetsEntity?> _fetchAssetsData(int index) async {
    final dataMap = {
      'getAssetsNew': 'getAssetsNew',
      'society_id': '1',
      'unit_id': '1718',
      'user_id': '1679',
      'language_id': '1',
      'floor_id': '1',
      'old_items': _mapIndexToOldItems(index),
    };

    final result = await useCases.getAssets(dataMap);
    return result.fold((failure) => null, (entity) => entity);
  }

  String _mapIndexToOldItems(int index) {
    switch (index) {
      case 0:
        return '0'; // Active
      case 1:
        return '1'; // Past
      default:
        return '0'; // All
    }
  }
}
