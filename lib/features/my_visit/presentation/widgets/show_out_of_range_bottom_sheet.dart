import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/face_detection_bloc/face_detection_bloc.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/current_location_with_label_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/gps_accuracy_status_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/out_of_range_image_message_widget.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
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
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
            imagePath: 'assets/face_detection/out_of_range.png',
            message: 'You are Out of Range(Ahmedabad)',
          ),
          const SizedBox(height: 4),

          CustomText(
            '480.45 Meter Away (Air Distance)',
            color: AppTheme.getColor(context).onSurface,
            fontWeight: FontWeight.w600,
            fontSize: 17 * Responsive.getResponsiveText(context),
          ),
          const SizedBox(height: 13),

          const GpsAccuracyStatusWidget(
            accuracyStatus: 'Medium',
            accuracyStatusColor: AppColors.spanishYellow,
          ),
          const SizedBox(height: 13),

          const CurrentLocationWithLabelWidget(
            address:
                'aafreen villa ner.jagruti school\n'
                'Sarkhej ahmedabad 382210,\n'
                'Makarba, Ahmedabad, Gujarat\n'
                '382210, India.',
          ),
          const SizedBox(height: 13),

          CustomText(
            'Visit Type',
            color: AppColors.textGray,
            fontSize: 16 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 5 * Responsive.getResponsive(context)),

          CustomPopupDropdownStyled<String>(
            height: 0.060 * Responsive.getHeight(context),
            spacing: 10 * Responsive.getResponsive(context),
            prefix: SvgPicture.asset('assets/face_detection/svgs/result.svg'),
            items: dayType,
            hintText: 'Select',
            selectedItem: selectedDayType,
            itemToString: (item) => item,
            onChanged: (value, index) {
              setState(() {
                selectedDayType = value;
              });
            },
          ),
          const SizedBox(height: 13),

          LabeledTextField(
            heightFactor: 60 * Responsive.getResponsive(context),
            textAlignment: TextAlign.start,
            label: 'Out of range Reason',
            hint: 'Select Date',
            widthFactor: Responsive.getWidth(context),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                10 * Responsive.getResponsive(context),
              ),
            ),
            prefix: SvgPicture.asset(
              'assets/face_detection/svgs/result.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: 23 * Responsive.getResponsive(context)),

          Row(
            spacing: 10 * Responsive.getResponsive(context),
            children: [
              Expanded(
                child: MyCoButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: 'Prev',
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w600,
                  ),
                  backgroundColor: AppTheme.getColor(context).primary,
                  boarderRadius: 30 * Responsive.getResponsive(context),
                  isShadowBottomLeft: true,
                ),
              ),
              Expanded(
                child: MyCoButton(
                  onTap: () {
                    // Handle  click event
                  },
                  title: 'Next',
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w600,
                  ),
                  backgroundColor: AppTheme.getColor(context).primary,
                  boarderRadius: 30 * Responsive.getResponsive(context),
                  isShadowBottomLeft: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),

          BlocBuilder<FaceDetectionBloc, FaceDetectionState>(
            builder: (context, state) {
              if (state is FaceDetectionLoaded) {
                return Center(
                  child: CustomText(
                    'Auto close in ${state.remainingTime}',
                    color: AppTheme.getColor(context).primary,
                    textAlign: TextAlign.center,
                  ),
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
