import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/face_detection_bloc/face_detection_bloc.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/auto_closed_timer_widgets.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/current_location_with_label_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/gps_accuracy_status_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/out_of_range_image_message_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/prev_next_btn_widget.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_labeled_dropdown.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class ShowOutOfRangeBottomSheet extends StatefulWidget {
  final ScrollController? scrollController;

  const ShowOutOfRangeBottomSheet({super.key, this.scrollController});

  @override
  State<ShowOutOfRangeBottomSheet> createState() =>
      _ShowOutOfRangeBottomSheetState();
}

class _ShowOutOfRangeBottomSheetState extends State<ShowOutOfRangeBottomSheet> {
  final List<String> dayType = ['full day', 'half day', 'holiday'];
  String? selectedDayType;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    controller: widget.scrollController,
    child: Container(
      padding: EdgeInsets.all(29 * Responsive.getResponsive(context)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.getColor(context).surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(13 * Responsive.getResponsive(context)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OutOfRangeImageMessageWidget(
            imagePath: AppAssets.outOfRange,
            message: 'you_are_out_off_range',
          ),
          SizedBox(height: 0.01 * Responsive.getHeight(context)),

          CustomText(
            '480.45 Meter Away (Air Distance)',
            color: AppTheme.getColor(context).onSurface,
            fontWeight: FontWeight.w600,
            fontSize: 17 * Responsive.getResponsiveText(context),
          ),
          SizedBox(height: 0.013 * Responsive.getHeight(context)),

          const GpsAccuracyStatusWidget(
            accuracyStatus: 'medium',
            accuracyStatusColor: AppColors.spanishYellow,
          ),
          SizedBox(height: 0.013 * Responsive.getHeight(context)),

          const CurrentLocationWithLabelWidget(
            address:
                'aafreen villa ner.jagruti school\n'
                'Sarkhej ahmedabad 382210,\n'
                'Makarba, Ahmedabad, Gujarat\n'
                '382210, India.',
          ),
          SizedBox(height: 0.015 * Responsive.getHeight(context)),

          LabeledDropdown(
            prefix: SvgPicture.asset(AppAssets.result),
            label: 'Day Type',
            items: dayType,
            hintText: 'Select',
            itemToString: (i) => i.toString(),
            selectedItem: selectedDayType,
            onChanged: (value, index) {
              setState(() {
                selectedDayType = value;
              });
            },
          ),
          SizedBox(height: 0.013 * Responsive.getHeight(context)),

          LabeledTextField(
            textAlignment: TextAlign.start,
            label: 'Out of range Reason',
            hint: 'Write Here',
            widthFactor: Responsive.getWidth(context),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                10 * Responsive.getResponsive(context),
              ),
            ),
            prefix: SvgPicture.asset(AppAssets.result, fit: BoxFit.scaleDown),
          ),
          SizedBox(height: 23 * Responsive.getResponsive(context)),

          const PrevNextBtnWidget(),
          SizedBox(height: 0.013 * Responsive.getHeight(context)),

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
        ],
      ),
    ),
  );
}
