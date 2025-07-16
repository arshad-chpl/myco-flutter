import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/face_detection_bloc/face_detection_bloc.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/warnings_alerts_messages.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_face_detection_widgets.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:permission_handler/permission_handler.dart';

class FaceDetectionPage extends StatefulWidget {
  const FaceDetectionPage({super.key});

  @override
  State<FaceDetectionPage> createState() => _FaceDetectionPageState();
}

class _FaceDetectionPageState extends State<FaceDetectionPage> with SingleTickerProviderStateMixin  {
  late AnimationController _scanController;
  late Animation<double> _topLineAlignment;
  late Animation<double> _bottomLineAlignment;

  String scanningSate = 'scanning';

  Future<void> cameraPermission() async {
    final status = await Permission.camera.status;

    if(status.isGranted) {
      _showSnackBar('Camera permission granted');
    } else if(status.isDenied) {
      final result = await Permission.camera.request();

      if(result.isGranted) {
        _showSnackBar('Granted after request');
      } else {
        _showSnackBar('Permission Denied');
      }
    } else if(status.isPermanentlyDenied) {
      _showSnackBar('Permission permanently denied. Opening setting...');
      await openAppSettings();
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message),),
    );
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

    // Start the animation after initializing both
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scanController.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _scanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
            icon: const Icon(Icons.arrow_back),
        ),
        title: const CustomText(
          'Hello, AJAJ',
            fontSize: 19,
            fontWeight: FontWeight.bold
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(23.0),
          child: Column(
            children: [
              BorderContainerWraper(
                width: double.infinity,
                backgroundColor: AppColors.secondary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        'Welcome To Work',
                        color: AppColors.white,
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.spanishYellow,
                              borderRadius: BorderRadius.circular(10)
                            ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                child: CustomText(
                                  'Flutter Developer'
                                ),
                              ),
                          ),


                          BlocBuilder<FaceDetectionBloc, FaceDetectionState>(
                              builder: (context, state) {
                                if(state is FaceDetectionLoaded) {

                                  return CustomText(
                                    state.dateTime.trim().isEmpty ? 'EMPTY' : state.dateTime,
                                    color: AppColors.white,
                                    fontSize: 14,
                                  );
                                }
                                return const CustomText('Loading...', color: AppColors.white,);
                              },
                          ),

                          // BlocBuilder<DateTimeBLoc, DateTimeState>(
                          //     builder: (context, state) {
                          //       if(state is DateTimeUpdated) {
                          //         return CustomText(
                          //           state.dateTime,
                          //           color: AppColors.white,
                          //           fontSize: 14,
                          //         );
                          //       }
                          //       return const CustomText('Loading...', color: AppColors.white,);
                          //     },
                          // )
                        ],
                      ),
                    ],
                  ),
              ),
              const SizedBox(height: 23,),
              BlocBuilder<FaceDetectionBloc, FaceDetectionState>(
                  builder: (context, state) {

                    if(state is FaceDetectionLoaded) {
                      if(state.scanningState != 'scanning') {
                        _scanController.stop();
                      } else if(!_scanController.isAnimating) {
                        _scanController.repeat(reverse: true);
                      }

                      return CustomFaceDetectionWidgets(
                        controller: state.controller,
                        scanningState: state.scanningState,
                        topLineAlignment: _topLineAlignment,
                        bottomLineAlignment: _bottomLineAlignment,
                        retry: () {
                          context.read<FaceDetectionBloc>().add(UpdateScanningState(scanningState: 'scanning'));
                          context.read<FaceDetectionBloc>().add(StartScanningTimer());
                        },
                      );

                    } else if (state is FaceDetectionLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is FaceDetectionError) {
                      return Center(child: Text(state.message));
                    }
                    return const Center(child: Text('Camera error'),);
                  },
              ),
              // BlocBuilder<CameraBloc, CameraState>(
              //   builder: (context, state) {
              //     if(state is OpenCamera) {
              //       return CustomFaceDetectionWidgets(
              //         controller: state.controller,
              //         scanningState: 'success',
              //         topLineAlignment: _topLineAlignment,
              //           bottomLineAlignment: _bottomLineAlignment,
              //         retry: onRetryFaceScan,
              //       );
              //     } else if (state is LoadingCamera) {
              //       return const Center(child: CircularProgressIndicator());
              //     } else if (state is CameraErrorState) {
              //       return Center(child: Text('Camera Error'));
              //     }
              //     return Center(child: Text('Camera error'),);
              //   },
              // ),
              const SizedBox(height: 13,),
              const CustomText(
                'Align your face within the frame',
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 40,),



              BlocBuilder<FaceDetectionBloc, FaceDetectionState>(
                  builder: (context, state) {
                    if(state is FaceDetectionLoaded) {
                      return Container(
                        height: 19,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: AppTheme.getColor(context).primary),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(11),
                          child: LinearProgressIndicator(
                            value: state.progress,
                            backgroundColor: Color.fromARGB(1, 220, 239, 255),
                            color: AppTheme.getColor(context).primary,
                          ),
                        )
                      );
                    }
                    return const SizedBox();
                  },
              ),


              // Container(
              //   height: 15,
              //   decoration: BoxDecoration(
              //     border: Border.all(width: 2, color: AppTheme.getColor(context).primary),
              //     borderRadius: BorderRadius.circular(13),
              //   ),
              //   child: const LinearProgressIndicator(
              //   ),
              // ),


              const SizedBox(height: 19,),


              BlocBuilder<FaceDetectionBloc, FaceDetectionState>(
                  builder: (context, state) {
                    if(state is FaceDetectionLoaded) {
                      return CustomText(
                        'Auto close in ${state.remainingTime}',
                        color: AppTheme.getColor(context).primary,
                      );
                    }
                    return const SizedBox();
                  },
              ),

              // CustomText(
              //   'Auto close in 01:59',
              //   color: AppTheme.getColor(context).primary,
              // ),




              const SizedBox(height: 10,),
              BorderContainerWraper(
                width: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        WarningsAlertsMessages(imagePath: 'assets/face_detection/danger.png', msg: 'Remove before scanning'),
                        SizedBox(height: 13,),
                        WarningsAlertsMessages(imagePath: 'assets/face_detection/circle.png', msg: 'Sunglasses'),
                        WarningsAlertsMessages(imagePath: 'assets/face_detection/circle.png', msg: 'Masks'),
                        WarningsAlertsMessages(imagePath: 'assets/face_detection/circle.png', msg: 'Cap/Hat'),
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
}
