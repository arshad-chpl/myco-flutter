import 'package:get_it/get_it.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/visit_with_bloc/Input_Tag_bloc.dart';

void visitWithDi(GetIt sl) {
  sl.registerFactory(InputTagBloc.new);
}