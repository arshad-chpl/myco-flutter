import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/visit_with_bloc/Department_tag_bloc/Input_Tag_event.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/visit_with_bloc/Department_tag_bloc/Input_Tag_state.dart';


class InputTagBloc extends Bloc<InputTagEvent, InputTagState> {
  InputTagBloc() : super(const InputTagState()) {
    on<AddDepartmentTagFromSheet>(_onAddFromSheetDepartment);
    on<RemoveDepartmentTag>(_onRemoveDepartment);
    on<AddBranchTagFromSheet>(_onAddFromSheetBranch);
    on<RemoveBranchTag>(_onRemoveBranch);

  }

  void _onAddFromSheetDepartment(AddDepartmentTagFromSheet event, Emitter<InputTagState> emit) {
    final updatedTags = List<String>.from(state.Departmenttags);
    if (event.Departmenttag.isNotEmpty && !updatedTags.contains(event.Departmenttag)) {
      updatedTags.add(event.Departmenttag);
      emit(state.copyWith(Departmenttags: updatedTags));
    }
  }

  void _onRemoveDepartment(RemoveDepartmentTag event, Emitter<InputTagState> emit) {
    final updatedTags = List<String>.from(state.Departmenttags);
    updatedTags.remove(event.Departmenttag);
    emit(state.copyWith(Departmenttags: updatedTags));
  }


  void _onAddFromSheetBranch(AddBranchTagFromSheet event, Emitter<InputTagState> emit) {
    final updatedTags = List<String>.from(state.Branchtags);
    if (event.Branchtag.isNotEmpty && !updatedTags.contains(event.Branchtag)) {
      updatedTags.add(event.Branchtag);
      emit(state.copyWith(Branchtags: updatedTags));
    }
  }

  void _onRemoveBranch(RemoveBranchTag event, Emitter<InputTagState> emit) {
    final updatedTags = List<String>.from(state.Branchtags);
    updatedTags.remove(event.Branchtag);
    emit(state.copyWith(Branchtags: updatedTags));
  }
}
