import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/visit_bloc.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/auto_closed_timer_widgets.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/current_location_with_label_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/gps_accuracy_status_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/out_of_range_image_message_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/prev_next_btn_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/show_date_time_widget.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_labeled_dropdown.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

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
           OutOfRangeImageMessageWidget(
            imagePath: AppAssets.outOfRange,
            message: LanguageManager().get('you_are_out_off_range'),
          ),
          SizedBox(height: 0.01 * Responsive.getHeight(context)),

          CustomText(
            '480.45 Meter Away (Air Distance)',
            color: AppTheme.getColor(context).onSurface,
            fontWeight: FontWeight.w600,
            fontSize: 17 * Responsive.getResponsiveText(context),
          ),
          SizedBox(height: 0.013 * Responsive.getHeight(context)),

           GpsAccuracyStatusWidget(
            accuracyStatus: LanguageManager().get('medium'),
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

          NewTextField(
              prefixIconPath: AppAssets.result,
              label: LanguageManager().get('day_type'),
              hintText: LanguageManager().get('select'),
            suffixIconPath: AppAssets.arrowDown,
          ),

          SizedBox(height: 0.015 * Responsive.getHeight(context)),
           NewTextField(
             enabled: false,
            label: LanguageManager().get('out_of_range_reason'),
            hintText: LanguageManager().get('write_here'),
            prefixIconPath: AppAssets.result,
          ),
          SizedBox(height: 0.013 * Responsive.getHeight(context)),
          const PrevNextBtnWidget(),
          SizedBox(height: 0.015 * Responsive.getHeight(context)),
          BlocBuilder<VisitBloc, VisitState>(
            builder: (context, state) {
              if (state is VisitLoaded) {
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
