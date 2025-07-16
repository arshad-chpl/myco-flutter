abstract class InputTagEvent {}

class AddDepartmentTagFromSheet extends InputTagEvent {
  final String Departmenttag;
  AddDepartmentTagFromSheet(this.Departmenttag);
}
class RemoveDepartmentTag extends InputTagEvent {
  final String Departmenttag;
  RemoveDepartmentTag(this.Departmenttag);
}


class AddBranchTagFromSheet extends InputTagEvent {
  final String Branchtag;
  AddBranchTagFromSheet(this.Branchtag);
}
class RemoveBranchTag extends InputTagEvent {
  final String Branchtag;
  RemoveBranchTag(this.Branchtag);
}