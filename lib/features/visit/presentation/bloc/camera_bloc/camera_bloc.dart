import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraController? controller;

  CameraBloc() : super(OpeningCamera()) {
    on<LaunchCamera>(onOpenCamera);
  }


  void onOpenCamera(CameraEvent event, Emitter<CameraState> emit) async {
    emit(LoadingCamera());

    try {
      final camera = await availableCameras();
      final frontCamera = camera.firstWhere((cam) => cam.lensDirection == CameraLensDirection.front,);

      controller = CameraController(frontCamera, ResolutionPreset.high);
      await controller!.initialize();

      emit(OpenCamera(controller: controller!));
    } catch (e){
      emit(CameraErrorState(message: e.toString()));
    }
  }

  @override
  Future<void> close() {
    controller?.dispose();
    return super.close();
  }

}