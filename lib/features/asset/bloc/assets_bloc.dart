import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/asset/bloc/assets_event.dart';
import 'package:myco_flutter/features/asset/bloc/assets_state.dart';

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
