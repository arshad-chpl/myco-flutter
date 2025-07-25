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
    on<TabChanged>(_ontabchange);
    on<UpdateSelectedDate>(_onDateUpdate);
    on<NextDate>(_onNextDate);
    on<PreviousDate>(_onPreviousDate);
  }
  ///face Detection
  Future<void> _onLaunchCamera(LaunchCamera event, Emitter<VisitState> emit) async {
    emit(VisitLoading());
    try {
      _controller?.dispose();
      final cams = await availableCameras();
      final front = cams.firstWhere((c) => c.lensDirection == CameraLensDirection.front);
      _controller = CameraController(front, ResolutionPreset.high, enableAudio: false);
      await _controller!.initialize();
      emit(VisitLoaded(
        cameracontroller: _controller,
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
  void _onStartDateTime(StartDateTime event, Emitter<VisitState> emit) {
    _dateTimeTimer?.cancel();
    _dateTimeTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      _dateTime = DateFormat('d-MM-yyyy h:mm:ss a').format(DateTime.now());
      add(UpdateDateTime(formattedDateAndTime: _dateTime));
    });
  }
  void _onUpdateDateTime(UpdateDateTime event, Emitter<VisitState> emit) {
    if (state is VisitLoaded) {
      emit((state as VisitLoaded).copyWith(dateTime: event.formattedDateAndTime));
    }
  }
  void _onUpdateScanningState(UpdateScanningState event, Emitter<VisitState> emit) {
    _scanState = event.scanningState;
    if (state is VisitLoaded) {
      emit((state as VisitLoaded).copyWith(scanningState: _scanState));
    }
  }
  void _onStartScanningTimer(StartScanningTimer event, Emitter<VisitState> emit) {
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
  void _onUpdateProgress(UpdateProgress event, Emitter<VisitState> emit) {
    if (state is VisitLoaded) {
      emit((state as VisitLoaded).copyWith(progress: event.progress, remainingTime: event.remainingTime));
    }
  }
  ///Tag_input logic
  void _onInitVisitTags(InitVisitTags event, Emitter<VisitState> emit) {
    if (state is! VisitLoaded) {
      emit(
        VisitLoaded(
          cameracontroller: null,
          dateTime: '',
          scanningState: 'idle',
          remainingTime: '00:00',
          progress: 0.0,
          branchTags: [],
          departmentTags: [],
          selectedIndex: 0,
        ),
      );
    }
  }

  void _onAddBranch(AddBranchTagFromSheet event, Emitter<VisitState> emit) {
    if (state is VisitLoaded) {
      final newstate = state as VisitLoaded;
      final updated = List<String>.from(newstate.branchTags)..add(event.branchTag);
      emit(newstate.copyWith(branchTags: updated));
    }
  }

  void _onRemoveBranch(RemoveBranchTag event, Emitter<VisitState> emit) {
    if (state is VisitLoaded) {
      final newstate = state as VisitLoaded;
      final updated = List<String>.from(newstate.branchTags)..remove(event.branchTag);
      emit(newstate.copyWith(branchTags: updated));
    }
  }

  void _onAddDepartment(AddDepartmentTagFromSheet event, Emitter<VisitState> emit) {
    if (state is VisitLoaded) {
      final newstate = state as VisitLoaded;
      final updated = List<String>.from(newstate.departmentTags)..add(event.departmentTag);
      emit(newstate.copyWith(departmentTags: updated));
    }
  }

  void _onRemoveDepartment(RemoveDepartmentTag event, Emitter<VisitState> emit) {
    if (state is VisitLoaded) {
      final newstate = state as VisitLoaded;
      final updated = List<String>.from(newstate.departmentTags)..remove(event.departmentTag);
      emit(newstate.copyWith(departmentTags: updated));
    }
  }
  ///MyVisit page
  void _ontabchange(TabChanged event , Emitter<VisitState>emit){
    final newstate = state;
    if (newstate is VisitLoaded) {
      emit(newstate.copyWith(selectedIndex: event.newIndex));
    }
  }
  void _onDateUpdate(UpdateSelectedDate event , Emitter<VisitState>emit){
    if (state is VisitLoaded) {
      emit((state as VisitLoaded).copyWith(selectedDate: event.newDate));
    }
  }
  void _onNextDate(NextDate event , Emitter<VisitState>emit){
    if (state is VisitLoaded) {
      final current = (state as VisitLoaded).selectedDate;
      emit((state as VisitLoaded).copyWith(selectedDate: current.add(const Duration(days: 1))));
    }
  }
  void _onPreviousDate(PreviousDate event , Emitter<VisitState>emit){
    if (state is VisitLoaded) {
      final current = (state as VisitLoaded).selectedDate;
      emit((state as VisitLoaded).copyWith(selectedDate: current.subtract(const Duration(days: 1))));
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
