abstract class WorkAllocationEvent {}

class FetchWorkAllocations extends WorkAllocationEvent {}

class AddWorkAllocation extends WorkAllocationEvent {
  final String title;
  final String description;

  AddWorkAllocation({required this.title, required this.description});
}
