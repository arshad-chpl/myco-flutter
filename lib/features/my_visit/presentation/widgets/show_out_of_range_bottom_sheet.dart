import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/face_detection_bloc/face_detection_bloc.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class ShowOutOfRangeBottomSheet extends StatefulWidget {
  final ScrollController? scrollController;
  const ShowOutOfRangeBottomSheet({super.key, this.scrollController});

  @override
  State<ShowOutOfRangeBottomSheet> createState() => _ShowOutOfRangeBottomSheetState();
}

class _ShowOutOfRangeBottomSheetState extends State<ShowOutOfRangeBottomSheet> {
  final List<String> dayType = ['full day', 'half day', 'holiday'];
  String? selectedDayType;

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
  Widget build(BuildContext context) => SingleChildScrollView(
    controller: widget.scrollController,
    padding: EdgeInsets.only(
      bottom: MediaQuery.of(context).viewInsets.bottom,
    ),
    child: Container(
        padding: EdgeInsets.all(29 * Responsive.getResponsive(context)),
        width: double.infinity,
        decoration:  BoxDecoration(
          color: AppTheme.getColor(context).surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(13 * Responsive.getResponsive(context))),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage(
                'assets/face_detection/out_of_range.png',
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  'You are Out of Range(Ahmedabad)',
                  fontSize: 21 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w700,
                  color: AppColors.textGray,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image(
                      image: const AssetImage(
                          'assets/face_detection/cross.png'

                      ),
                      color: AppTheme.getColor(context).onSurface,
                      height: 0.030 * Responsive.getHeight(context),
                      width:  0.030 *  Responsive.getWidth(context),
                  ),
                )
              ],
            ),
            const SizedBox(height: 4),
            CustomText(
              '480.45 Meter Away (Air Distance)',
              color: AppTheme.getColor(context).onSurface,
              fontWeight: FontWeight.w600,
              fontSize: 17 * Responsive.getResponsiveText(context),
            ),
            const SizedBox(height: 13),
            Row(
              children: [
                showDateTime(
                  context,
                  AppTheme.getColor(context).onSurface,
                  FontWeight.w600,
                ),
                const SizedBox(width: 14),
                CustomText(
                  'GPS Accuracy : ',
                  color: AppTheme.getColor(context).onSurface,
                  fontWeight: FontWeight.w600,
                  fontSize: 17 * Responsive.getResponsiveText(context),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: AppColors.spanishYellow,
                      width: 5 * Responsive.getResponsiveOnWidth(context),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6 * Responsive.getResponsive(context),
                      vertical: 1 * Responsive.getResponsive(context),
                    ),
                    child: CustomText(
                      'Medium',
                      fontSize: 13 * Responsive.getResponsiveText(context),
                      color: AppColors.spanishYellow,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 13),
            CustomText(
                'current location',
                color: AppColors.textGray,
                fontSize: 16 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.bold
            ),
            const SizedBox(height: 5,),
            BorderContainerWraper(
              borderColor: AppColors.borderColor,
              width: double.infinity,
              backgroundColor: AppColors.removeBackground,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5 * Responsive.getResponsive(context),
                    ),
                    child: Image(
                      image: const AssetImage(
                        'assets/face_detection/location_icon.png',
                      ),
                      height: 0.060 * Responsive.getHeight(context),
                      width: 0.060 * Responsive.getWidth(context),
                      color: const Color.fromARGB(255, 34, 42, 110),
                    ),
                  ),
                  const SizedBox(width: 10),
                  CustomText(
                    'aafreen villa ner.jagruti school\n'
                        'Sarkhej ahmedabad 382210,\n'
                        'Makarba, Ahmedabad, Gujarat\n'
                        '382210, India.',
                    color: const Color.fromARGB(255, 34, 42, 110),
                    fontWeight: FontWeight.w600,
                    fontSize: 15 * Responsive.getResponsiveText(context),
                  ),
                  const SizedBox(width: 19),
                  const Image(
                    image: AssetImage(
                      'assets/face_detection/location_preview.png',
                    ),
                    height: 72,
                    width: 72,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 13),
            CustomText(
                'Visit Type',
                color: AppColors.textGray,
                fontSize: 16 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.bold
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
                borderSide: BorderSide(
                  color: AppTheme.getColor(context).outline,
                ),
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
            const SizedBox(height: 13,),
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
