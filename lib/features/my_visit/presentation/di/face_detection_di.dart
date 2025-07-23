import 'package:get_it/get_it.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/visit_bloc.dart';

void faceDetectionDi(GetIt sl) {
  sl.registerFactory(VisitBloc.new);
}
