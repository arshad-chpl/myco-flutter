import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/face_detection_bloc/face_detection_bloc.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/draggable_scrollable_sheet_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/greeting_message_card_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/show_out_of_range_bottom_sheet.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/warning_message_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_face_detection_widgets.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:permission_handler/permission_handler.dart';

class FaceDetectionPage extends StatefulWidget {
  const FaceDetectionPage({super.key});

  @override
  State<FaceDetectionPage> createState() => _FaceDetectionPageState();
}

class _FaceDetectionPageState extends State<FaceDetectionPage>
    with SingleTickerProviderStateMixin {

  late AnimationController _scanController;
  late Animation<double> _topLineAlignment;
  late Animation<double> _bottomLineAlignment;

  final ScrollController scrollController = ScrollController();

  String scanningSate = 'scanning';

  Future<void> cameraPermission() async {
    final status = await Permission.camera.status;

    if (status.isGranted) {
      Fluttertoast.showToast(msg: 'Camera permission granted');
    } else if (status.isDenied) {
      final result = await Permission.camera.request();

      if (result.isGranted) {
        Fluttertoast.showToast(msg: 'Granted after request');
      } else {
        Fluttertoast.showToast(msg: 'Permission Denied');
      }
    } else if (status.isPermanentlyDenied) {
      Fluttertoast.showToast(msg: 'Permission permanently denied. Opening setting...');
      await openAppSettings();
    }
  }

  @override
  void initState() {
    super.initState();
    cameraPermission();

    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _topLineAlignment = Tween<double>(begin: 30, end: 120).animate(
      CurvedAnimation(parent: _scanController, curve: Curves.easeInOut),
    );

    _bottomLineAlignment = Tween<double>(begin: 200, end: 110).animate(
      CurvedAnimation(parent: _scanController, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scanController.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    Theme.of(context);
    _scanController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      title: CustomText(
        'Hello, AJAJ',
        fontSize: 23 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.bold,
      ),
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
                        )
                    )
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
              const SizedBox(height: 23),

              BlocBuilder<FaceDetectionBloc, FaceDetectionState>(
                builder: (context, state) {
                  if (state is FaceDetectionLoaded) {
                    if (state.scanningState != 'scanning') {
                      _scanController.stop();
                    } else if (!_scanController.isAnimating) {
                      _scanController.repeat(reverse: true);
                    }

                    return CustomFaceDetectionWidgets(
                      controller: state.controller,
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
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is FaceDetectionError) {
                    return Center(child: Text(state.message));
                  }
                  return const Center(child: Text('Camera error'));
                },
              ),
              const SizedBox(height: 13),

              CustomText(
                'Align your face within the frame',
                fontWeight: FontWeight.w700,
                fontSize: 21 * Responsive.getResponsiveText(context),
              ),
              const SizedBox(height: 40),

              BlocBuilder<FaceDetectionBloc, FaceDetectionState>(
                builder: (context, state) {
                  if (state is FaceDetectionLoaded) {
                    return Container(
                      height: 0.021 * Responsive.getHeight(context),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 5 * Responsive.getResponsiveOnWidth(context),
                          color: AppTheme.getColor(context).primary,
                        ),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11),
                        child: LinearProgressIndicator(
                          value: state.progress,
                          backgroundColor: const Color.fromARGB(255, 220, 239, 255),
                          color: AppTheme.getColor(context).primary,
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(height: 19),

              BlocBuilder<FaceDetectionBloc, FaceDetectionState>(
                builder: (context, state) {
                  if (state is FaceDetectionLoaded) {
                    return CustomText(
                      'Auto close in ${state.remainingTime}',
                      color: AppTheme.getColor(context).primary,
                    );
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(height: 10),

              const WarningMessageCard(),
            ],
          ),
        ),
      ),
    ),
  );
}
