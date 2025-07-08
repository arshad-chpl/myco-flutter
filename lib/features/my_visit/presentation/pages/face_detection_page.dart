import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/face_detection_bloc/face_detection_bloc.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/show_out_of_range_bottom_sheet.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/warnings_alerts_messages.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
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
      _showSnackBar('Camera permission granted');
    } else if (status.isDenied) {
      final result = await Permission.camera.request();

      if (result.isGranted) {
        _showSnackBar('Granted after request');
      } else {
        _showSnackBar('Permission Denied');
      }
    } else if (status.isPermanentlyDenied) {
      _showSnackBar('Permission permanently denied. Opening setting...');
      await openAppSettings();
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Widget showDateTime(BuildContext context, Color color, FontWeight weight) =>
      BlocBuilder<FaceDetectionBloc, FaceDetectionState>(
        builder: (context, state) {
          if (state is FaceDetectionLoaded) {
            return CustomText(
              state.dateTime.trim().isEmpty ? 'EMPTY' : state.dateTime,
              color: color,
              fontSize: 17 * Responsive.getResponsiveText(context),
              fontWeight: weight,
            );
          }
          return const CustomText('Loading...', color: AppColors.white);
        },
      );

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
                    child: DraggableScrollableSheet(
                      expand: false,
                      initialChildSize: 0.9,
                      maxChildSize: 0.95,
                      minChildSize: 0.6,
                      builder: (context, scrollController) => Stack(
                        children: [
                          BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: 2,
                              sigmaY: 2
                            ),
                            child: Container(
                              color: Colors.transparent,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Material(
                              color: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppTheme.getColor(context).onSecondary,
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(13)),
                                ),
                                child: ShowOutOfRangeBottomSheet(scrollController: scrollController,),
                              ),
                            ),
                          )
                        ],
                      ),
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
              BorderContainerWraper(
                width: double.infinity,
                backgroundColor: AppColors.secondary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'Welcome To Work',
                      fontSize: 23 * Responsive.getResponsiveText(context),
                      color: AppTheme.getColor(context).onSecondary,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.spanishYellow,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10 * Responsive.getResponsive(context),
                              vertical: 3 * Responsive.getResponsive(context),
                            ),
                            child: const CustomText('Flutter Developer'),
                          ),
                        ),

                        showDateTime(
                          context,
                          AppTheme.getColor(context).onSecondary,
                          FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
              const CustomText(
                'Align your face within the frame',
                fontWeight: FontWeight.bold,
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
              BorderContainerWraper(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(8.0 * Responsive.getResponsive(context)),
                  child: const Column(
                    children: [
                      WarningsAlertsMessages(
                        imagePath: 'assets/face_detection/danger.png',
                        msg: 'Remove before scanning',
                      ),
                      SizedBox(height: 13),
                      WarningsAlertsMessages(
                        imagePath: 'assets/face_detection/circle.png',
                        msg: 'Sunglasses',
                      ),
                      WarningsAlertsMessages(
                        imagePath: 'assets/face_detection/circle.png',
                        msg: 'Masks',
                      ),
                      WarningsAlertsMessages(
                        imagePath: 'assets/face_detection/circle.png',
                        msg: 'Cap/Hat',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
