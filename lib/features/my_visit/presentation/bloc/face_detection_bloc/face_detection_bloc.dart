import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'face_detection_event.dart';

part 'face_detection_state.dart';

class FaceDetectionBloc extends Bloc<FaceDetectionEvent, FaceDetectionState> {
  CameraController? controller;
  Timer? scanningTimer;
  Timer? dateTimeTimer;
  String currentDateAndTime = '';
  String scanningState = 'scanning'.toLowerCase();

  FaceDetectionBloc() : super(FaceDetectionInitial()) {
    on<LaunchCamera>(onOpenCamera);
    on<StartDateTime>(onStartDateTime);
    on<UpdateDateTime>(onUpdateDateTime);
    on<UpdateScanningState>(onUpdateScanningState);
    on<StartScanningTimer>(onStartScanningTimer);
    on<UpdateProgress>(onUpdateProgress);
  }

  void onOpenCamera(
    FaceDetectionEvent event,
    Emitter<FaceDetectionState> emit,
  ) async {
    if (controller?.value.isInitialized ?? false) return;

    // if (controller != null && controller!.value.isInitialized) {
    //   return;
    // }

    emit(FaceDetectionLoading());
    try {
      if (controller != null) {
        await controller!.dispose();
        controller = null;
      }

      final camera = await availableCameras();
      final frontCamera = camera.firstWhere(
        (cam) => cam.lensDirection == CameraLensDirection.front,
      );

      controller = CameraController(
        frontCamera,
        ResolutionPreset.high,
        enableAudio: false,
      );
      await controller!.initialize();

      emit(
        FaceDetectionLoaded(
          controller: controller!,
          dateTime: '',
          scanningState: scanningState,
          remainingTime: '02:00',
          progress: 0.0,
        ),
      );

      add(StartDateTime());

      add(StartScanningTimer());
    } catch (e) {
      emit(FaceDetectionError(message: e.toString()));
    }
  }

  void onStartDateTime(
    StartDateTime event,
    Emitter<FaceDetectionState> emit,
  ) async {
    dateTimeTimer?.cancel();

    dateTimeTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      final now = DateTime.now();
      final formattedDateAndTime = DateFormat(
        'd-MM-yyyy h:mm:ss a',
      ).format(now);
      add(UpdateDateTime(formattedDateAndTime: formattedDateAndTime));
    });
  }

  void onUpdateDateTime(
    UpdateDateTime event,
    Emitter<FaceDetectionState> emit,
  ) {
    currentDateAndTime = event.formattedDateAndTime;

    if (state is FaceDetectionLoaded) {
      final current = state as FaceDetectionLoaded;

      emit(current.copyWith(dateTime: currentDateAndTime));
    }
  }

  void onUpdateScanningState(
    UpdateScanningState event,
    Emitter<FaceDetectionState> emit,
  ) {
    scanningState = event.scanningState;

    if (state is FaceDetectionLoaded) {
      final current = state as FaceDetectionLoaded;
      emit(
        current.copyWith(
          scanningState: scanningState,
          dateTime: currentDateAndTime,
        ),
      );
    } else if (controller != null) {
      emit(
        FaceDetectionLoaded(
          controller: controller!,
          dateTime: currentDateAndTime,
          scanningState: scanningState,
          progress: 0.0,
          remainingTime: '02:00',
        ),
      );
    }
  }

  void onStartScanningTimer(
    StartScanningTimer event,
    Emitter<FaceDetectionState> emit,
  ) {
    const int totalSeconds = 120;
    int secondsPassed = 0;

    scanningTimer?.cancel();

    scanningTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (state is! FaceDetectionLoaded) {
        t.cancel();
        return;
      }

      final current = state as FaceDetectionLoaded;

      if (secondsPassed >= totalSeconds || current.scanningState == 'success') {
        t.cancel();

        if (current.scanningState != 'success') {
          Future.microtask(() {
            if (!isClosed) add(UpdateScanningState(scanningState: 'failure'));
          });
        }
        return;
      }

      secondsPassed++;

      final minutes = ((totalSeconds - secondsPassed) ~/ 60).toString().padLeft(
        2,
        '0',
      );
      final seconds = ((totalSeconds - secondsPassed) % 60).toString().padLeft(
        2,
        '0',
      );
      final progress = secondsPassed / totalSeconds;

      Future.microtask(() {
        if (!isClosed) {
          add(
            UpdateProgress(
              progress: progress,
              remainingTime: '$minutes:$seconds',
            ),
          );
        }
      });
    });
  }

  void onUpdateProgress(
    UpdateProgress event,
    Emitter<FaceDetectionState> emit,
  ) {
    if (state is FaceDetectionLoaded) {
      final current = state as FaceDetectionLoaded;

      emit(
        current.copyWith(
          progress: event.progress,
          remainingTime: event.remainingTime,
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    await controller?.dispose();
    scanningTimer?.cancel();
    dateTimeTimer?.cancel();
    return super.close();
  }
}
