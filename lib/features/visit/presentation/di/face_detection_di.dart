import 'package:get_it/get_it.dart';
import 'package:myco_flutter/features/visit/presentation/bloc/face_detection_bloc/face_detection_bloc.dart';

void faceDetectionDi(GetIt sl) {
  sl.registerFactory(FaceDetectionBloc.new);
}