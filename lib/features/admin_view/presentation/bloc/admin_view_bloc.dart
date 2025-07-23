import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/admin_view/data/models/admin_view_request.dart';
import 'package:myco_flutter/features/admin_view/domain/entities/admin_view_entity.dart';
import 'package:myco_flutter/features/admin_view/domain/usecases/admin_view_use_case.dart';

part 'admin_view_event.dart';
part 'admin_view_state.dart';

class AdminViewBloc extends Bloc<AdminViewEvent, AdminViewState> {
  final AdminViewUseCase adminViewUseCase;

  AdminViewBloc({
    required this.adminViewUseCase,
  }) : super(AdminViewInitial()) {
    on<FetchAdminView>(_onFetchAdminView);
  }

  Future<void> _onFetchAdminView(
      FetchAdminView event,
      Emitter<AdminViewState> emit,
      ) async {
    emit(AdminViewLoading());

    // First, try to load and emit data from the cache using the cache use case method
    final cachedResult = await adminViewUseCase.getCachedAdminView(event.companyId);
    cachedResult.fold((failure) {
      /* Do nothing on cache failure, just proceed to fetch */
    }, (entity) => emit(AdminViewLoaded(adminViewData: entity)));

    // Second, fetch fresh data from the network using the other use case method
    final params = AdminViewRequest(
        tag: 'getAdminViewNew',
        companyId: event.companyId,
        userId: event.userId,
        languageId: event.languageId,
        isDashboard: true,
        shouldCache: true, // Conditionally cache the fresh data
        accessTypeId: ''
    );
    final freshResult = await adminViewUseCase.getAdminView(params);

    // Finally, emit the fresh data or an error if fetching failed
    freshResult.fold((failure) {
      // Only show a network error if we don't have any cached data loaded
      if (state is! AdminViewLoaded) {
        emit(AdminViewError(message: failure.message));
      }
    }, (entity) => emit(AdminViewLoaded(adminViewData: entity)));
  }
}