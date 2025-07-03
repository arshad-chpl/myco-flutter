import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/idea_box/presentation/bloc/list_idea_event.dart';
import 'package:myco_flutter/features/idea_box/presentation/bloc/list_idea_state.dart';

class ListIdeaBloc  extends Bloc<ListIdeaEvent, ListIdeaState>{

  ListIdeaBloc(): super(IdeaBoxInitialState()){
    on<IdeaTabChangeEvent>(IdeaTabChange);
  }

  void IdeaTabChange(IdeaTabChangeEvent event, Emitter<ListIdeaState> emit){
    emit(IdeaTabChangeState(selectedIndex: event.index));
  }
}