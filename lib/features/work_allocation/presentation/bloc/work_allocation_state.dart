abstract class WorkAllocationState {}

class WorkAllocationInitial extends WorkAllocationState {}

class WorkAllocationLoading extends WorkAllocationState {}

class WorkAllocationLoaded extends WorkAllocationState {
  final List<String> items; // simple for demo

  WorkAllocationLoaded(this.items);
}

class WorkAllocationError extends WorkAllocationState {
  final String message;

  WorkAllocationError(this.message);
}
