import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myco_flutter/core/utils/app_permissions.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/face_detection_bloc/face_detection_bloc.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/auto_closed_timer_widgets.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/camera_shimmer_widgets.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/draggable_scrollable_sheet_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/greeting_message_card_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/linear_progress_indicator_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/show_out_of_range_bottom_sheet.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/warning_message_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_face_detection_widgets.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class FaceDetectionPage extends StatefulWidget {
  const FaceDetectionPage({super.key});

  @override
  State<FaceDetectionPage> createState() => _FaceDetectionPageState();
}

class _FaceDetectionPageState extends State<FaceDetectionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController? _scanController;
  late Animation<double> _topLineAlignment;
  late Animation<double> _bottomLineAlignment;

  final ScrollController scrollController = ScrollController();

  String scanningSate = 'scanning';

  Future<void> cameraPermission(BuildContext context) async {

    final results = await PermissionUtil.requestMultiplePermissions([
      AppPermission.camera,
      AppPermission.microphone
    ]);

    final isCameraPermissionGranted = results[AppPermission.camera] ?? false;
    final isMicroPhonePermissionGranted = results[AppPermission.microphone] ?? false;

    if(isCameraPermissionGranted && isMicroPhonePermissionGranted) {
      Fluttertoast.showToast(msg: 'Camera and audio permission granted');
    } else if(!isCameraPermissionGranted || !isMicroPhonePermissionGranted) {
      if(context.mounted) {
        PermissionUtil.showPermissionDeniedDialog(
            context,
            message: 'Camera and MicroPhone permission required for face detection'
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();

    cameraPermission(context);

    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _topLineAlignment = Tween<double>(begin: 30, end: 120).animate(
      CurvedAnimation(parent: _scanController!, curve: Curves.easeInOut),
    );

    _bottomLineAlignment = Tween<double>(begin: 200, end: 110).animate(
      CurvedAnimation(parent: _scanController!, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scanController!.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    Theme.of(context);
    _scanController!.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      title: 'hello Ajaj',
      actions: [
        IconButton(
          onPressed: () {
            final faceDetectionBloc = context.read<FaceDetectionBloc>();

            showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: 'Dismiss',
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder: (_, _, _) => BlocProvider.value(
                value: faceDetectionBloc,
                child: DraggableScrollableSheetWidget(
                  showBottomSheet: ShowOutOfRangeBottomSheet(
                    scrollController: scrollController,
                  ),
                ),
              ),
            );
          },
          icon: const Icon(Icons.more_vert),
        ),
      ],
    ),
    body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(23.0 * Responsive.getResponsive(context)),
          child: Column(
            children: [
              const GreetingMessageCardWidget(),
              SizedBox(height: 23 * Responsive.getResponsive(context)),

              BlocBuilder<FaceDetectionBloc, FaceDetectionState>(
                builder: (context, state) {
                  if (state is FaceDetectionLoaded) {
                    if (state.scanningState != 'scanning') {
                      _scanController!.stop();
                    } else if (!_scanController!.isAnimating) {
                      _scanController!.repeat(reverse: true);
                    }
                    return CustomFaceDetectionWidgets(
                      controller: state.controller,
                      /**
                           * Sets the scanning state use for UI display
                           *
                           * Valid values:
                           * - 'scanning' -> When scanning is in progress.
                           * - 'success' -> When the face has been successfully scanned.
                           * - 'failure' -> When the scan failed or timed out.
                           *
                           * @param scanningState The state of scan
                           * */
                      scanningState: state.scanningState,
                      topLineAlignment: _topLineAlignment,
                      bottomLineAlignment: _bottomLineAlignment,
                      retry: () {
                        context.read<FaceDetectionBloc>().add(
                          UpdateScanningState(scanningState: 'scanning'),
                        );
                        context.read<FaceDetectionBloc>().add(
                          StartScanningTimer(),
                        );
                      },
                    );
                  } else if (state is FaceDetectionLoading) {
                    return const CameraShimmerWidgets();
                    // return const Center(child: CircularProgressIndicator());
                  } else if (state is FaceDetectionError) {
                    return Center(child: CustomText(state.message));
                  }
                  return const Center(child: CustomText('Camera error'));
                },
              ),
              SizedBox(height: 0.013 * Responsive.getHeight(context)),

              CustomText(
                'Align your face within the frame',
                fontWeight: FontWeight.w700,
                fontSize: 21 * Responsive.getResponsiveText(context),
              ),
              SizedBox(height: 0.040 * Responsive.getHeight(context)),

              BlocBuilder<FaceDetectionBloc, FaceDetectionState>(
                builder: (context, state) {
                  if (state is FaceDetectionLoaded) {
                    return LinearProgressIndicatorWidget(
                      progress: state.progress,
                    );
                  }
                  return const SizedBox();
                },
              ),
              SizedBox(height: 0.019 * Responsive.getHeight(context)),

              BlocBuilder<FaceDetectionBloc, FaceDetectionState>(
                builder: (context, state) {
                  if (state is FaceDetectionLoaded) {
                    return AutoClosedTimerWidgets(
                      remainingTime: state.remainingTime,
                    );
                  }
                  return const SizedBox();
                },
              ),
              SizedBox(height: 0.017 * Responsive.getHeight(context)),

              const WarningMessageCard(),
            ],
          ),
        ),
      ),
    ),
  );
}
