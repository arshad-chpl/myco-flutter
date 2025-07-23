import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'visit_event.dart';
part 'visit_state.dart';

class VisitBloc extends Bloc<VisitEvent, VisitState> {
  CameraController? _controller;
  Timer? _dateTimeTimer, _scanningTimer;
  String _dateTime = '';
  String _scanState = 'scanning';
  VisitBloc() : super(VisitInitial()) {
    on<InitVisitTags>(_onInitVisitTags);
    on<LaunchCamera>(_onLaunchCamera);
    on<StartDateTime>(_onStartDateTime);
    on<UpdateDateTime>(_onUpdateDateTime);
    on<UpdateScanningState>(_onUpdateScanningState);
    on<StartScanningTimer>(_onStartScanningTimer);
    on<UpdateProgress>(_onUpdateProgress);
    on<AddBranchTagFromSheet>(_onAddBranch);
    on<RemoveBranchTag>(_onRemoveBranch);
    on<AddDepartmentTagFromSheet>(_onAddDepartment);
    on<RemoveDepartmentTag>(_onRemoveDepartment);
  }
  Future<void> _onLaunchCamera(LaunchCamera e, Emitter<VisitState> emit) async {
    emit(VisitLoading());
    try {
      _controller?.dispose();
      final cams = await availableCameras();
      final front = cams.firstWhere((c) => c.lensDirection == CameraLensDirection.front);
      _controller = CameraController(front, ResolutionPreset.high, enableAudio: false);
      await _controller!.initialize();
      emit(VisitLoaded(
        controller: _controller,
        dateTime: '',
        scanningState: _scanState,
        remainingTime: '02:00',
        progress: 0.0,
        branchTags: const [],
        departmentTags: const [],
      ));
      add(StartDateTime());
      add(StartScanningTimer());
    } catch (err) {
      emit(VisitError(message: err.toString()));
    }
  }
  void _onStartDateTime(StartDateTime e, Emitter<VisitState> emit) {
    _dateTimeTimer?.cancel();
    _dateTimeTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      _dateTime = DateFormat('d-MM-yyyy h:mm:ss a').format(DateTime.now());
      add(UpdateDateTime(formattedDateAndTime: _dateTime));
    });
  }
  void _onUpdateDateTime(UpdateDateTime e, Emitter<VisitState> emit) {
    if (state is VisitLoaded) {
      emit((state as VisitLoaded).copyWith(dateTime: e.formattedDateAndTime));
    }
  }
  void _onUpdateScanningState(UpdateScanningState e, Emitter<VisitState> emit) {
    _scanState = e.scanningState;
    if (state is VisitLoaded) {
      emit((state as VisitLoaded).copyWith(scanningState: _scanState));
    }
  }
  void _onStartScanningTimer(StartScanningTimer e, Emitter<VisitState> emit) {
    const total = 120;
    int counter = 0;
    _scanningTimer?.cancel();
    _scanningTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (state is! VisitLoaded) return t.cancel();
      if (counter >= total || _scanState == 'success') {
        t.cancel();
        if (_scanState != 'success') add(UpdateScanningState(scanningState: 'failure'));
        return;
      }
      counter++;
      final rem = '${((total - counter) ~/ 60).toString().padLeft(2, '0')}:${((total - counter) % 60).toString().padLeft(2, '0')}';
      final prog = counter / total;
      add(UpdateProgress(progress: prog, remainingTime: rem));
    });
  }
  void _onUpdateProgress(UpdateProgress e, Emitter<VisitState> emit) {
    if (state is VisitLoaded) {
      emit((state as VisitLoaded).copyWith(progress: e.progress, remainingTime: e.remainingTime));
    }
  }
  //tag_input logic
  void _onInitVisitTags(InitVisitTags event, Emitter<VisitState> emit) {
    if (state is! VisitLoaded) {
      emit(
        VisitLoaded(
          controller: null,
          dateTime: '',
          scanningState: 'idle',
          remainingTime: '00:00',
          progress: 0.0,
          branchTags: [],
          departmentTags: [],
        ),
      );
    }
  }

  void _onAddBranch(AddBranchTagFromSheet e, Emitter<VisitState> emit) {
    if (state is VisitLoaded) {
      final s = state as VisitLoaded;
      final updated = List<String>.from(s.branchTags)..add(e.branchTag);
      emit(s.copyWith(branchTags: updated));
    }
  }

  void _onRemoveBranch(RemoveBranchTag e, Emitter<VisitState> emit) {
    if (state is VisitLoaded) {
      final s = state as VisitLoaded;
      final updated = List<String>.from(s.branchTags)..remove(e.branchTag);
      emit(s.copyWith(branchTags: updated));
    }
  }

  void _onAddDepartment(AddDepartmentTagFromSheet e, Emitter<VisitState> emit) {
    if (state is VisitLoaded) {
      final s = state as VisitLoaded;
      final updated = List<String>.from(s.departmentTags)..add(e.departmentTag);
      emit(s.copyWith(departmentTags: updated));
    }
  }

  void _onRemoveDepartment(RemoveDepartmentTag e, Emitter<VisitState> emit) {
    if (state is VisitLoaded) {
      final s = state as VisitLoaded;
      final updated = List<String>.from(s.departmentTags)..remove(e.departmentTag);
      emit(s.copyWith(departmentTags: updated));
    }
  }
  @override
  Future<void> close() {
    _controller?.dispose();
    _dateTimeTimer?.cancel();
    _scanningTimer?.cancel();
    return super.close();
  }
}
