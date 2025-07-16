import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/asset/domain/usecases/asset_usecases.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/assets_event.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/assets_state.dart';

class AssetsTabBloc extends Bloc<AssetsTabEvent, AssetsTabState> {
  AssetsTabBloc() : super(AssetsTabState(selectedIndex: 0)) {
    on<TabChanged>((event, emit) {
      emit(AssetsTabState(selectedIndex: event.index));
    });
  }
}

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

  AssetsBloc(this.useCases) : super(AssetsInitial()) {
    on<FetchAssetsEvent>(_onFetchAssets);
  }

  Future<void> _onFetchAssets(
    FetchAssetsEvent event,
    Emitter<AssetsState> emit,
  ) async {
    emit(AssetsLoading());

    final dataMap = {
      "getAssetsNew": "getAssetsNew",
      "society_id": "1",
      "unit_id": "1718",
      "user_id": "1679",
      "language_id": "1",
      "floor_id": "1",
      "old_items": event.oldItems, // 🟢 dynamic handling
    };

    final result = await useCases.getAssets(dataMap);

    result.fold(
      (Failure failure) => emit(AssetsError(failure.message)),
      (entity) => emit(AssetsLoaded(entity)),
    );
  }
}
