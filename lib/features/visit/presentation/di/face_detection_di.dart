import 'package:get_it/get_it.dart';
import 'package:myco_flutter/features/visit/presentation/bloc/camera_bloc/camera_bloc.dart';
import 'package:myco_flutter/features/visit/presentation/bloc/date_time_bloc/date_time_bloc.dart';

void faceDetectionDi(GetIt sl) {
  sl.registerFactory(DateTimeBLoc.new,);
  sl.registerFactory(CameraBloc.new,);
}